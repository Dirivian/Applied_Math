! =========================================================
subroutine rp1(maxmx,meqn,mwaves,maux,mbc,mx,ql,qr,auxl,auxr,wave,s,amdq,apdq)
! =========================================================

! Solve Riemann problems for the p system
!   (v)_t - (u )_x = 0
!   (u)_t + ( p(v))_x = 0
! using Roe's approximate Riemann solver with entropy fix for
! transonic rarefractions.

! waves: 2
! equations: 2

! Conserved quantities:
!       v
!       u

! This function solves the Riemann problem at all interfaces in one call

! On input, ql contains the state vector at the left edge of each cell
!           qr contains the state vector at the right edge of each cell
! On output, wave contains the waves,
!            s the speeds,
!            amdq the  left-going flux difference  A^- \Delta q
!            apdq the right-going flux difference  A^+ \Delta q

! Note that the i'th Riemann problem has left state qr(:,i-1)
!                                    and right state ql(:,i)
! From the basic clawpack routine step1, rp is called with ql = qr = q.


    implicit none

    integer, intent(in) :: maxmx, meqn, mwaves, maux, mbc, mx
    real(kind=8), intent(in), dimension(meqn,1-mbc:maxmx+mbc) :: ql, qr
    real(kind=8), intent(in), dimension(maux,1-mbc:maxmx+mbc) :: auxl, auxr
    real(kind=8), intent(out) :: s(mwaves, 1-mbc:maxmx+mbc)
    real(kind=8), intent(out) :: wave(meqn, mwaves, 1-mbc:maxmx+mbc)
    real(kind=8), intent(out), dimension(meqn,1-mbc:maxmx+mbc) :: amdq,apdq

    ! local variables:
    real(kind=8) :: a1,a2,
    integer :: i


!   # Gravity constant set in setprob.f or the shallow1D.py file
    real(kind=8) :: grav
    common /cparam/ grav

!   # Local storage
!   ---------------
    dimension delta(2)
    logical :: efix

    data efix /.true./    !# Use entropy fix for transonic rarefactions


!   # Main loop of the Riemann solver.
    do 30 i=2-mbc,mx+mbc
    
    
    !     # compute  Roe-averaged quantities:

        cbar=dsqrt((exp(qr(1,i-1)) - exp(ql(1,i)))/(qr(1,i-1) - ql(1,i)))
                 
    !     # delta(1)=h(i)-h(i-1) and  delta(2)=hu(i)-hu(i-1)
        delta(1) = ql(1,i) - qr(1,i-1)
        delta(2) = ql(2,i) - qr(2,i-1)

    !     # Compute coeffs in the evector expansion of delta(1),delta(2)
        a1 = 0.5d0*(delta(1) -  delta(2)/(cbar) )
        a2 = 0.5d0*(delta(1) +  delta(2)/(cbar) )

    !     # Finally, compute the waves.
        wave(1,1,i) = a1
        wave(2,1,i) = a1*( cbar)
        s(1,i) =  - cbar
                 
        wave(1,2,i) = a2
        wave(2,2,i) = a2*(- cbar)
        s(2,i) =  cbar
                 
    30 enddo

!     # Compute fluctuations amdq and apdq
!     ------------------------------------

    if (efix) go to 110

!     # No entropy fix
!     ----------------------------------------------
!     # amdq = SUM s*wave   over left-going waves
!     # apdq = SUM s*wave   over right-going waves

    do m=1,2
        do i=2-mbc, mx+mbc
            amdq(m,i) = 0.d0
            apdq(m,i) = 0.d0
            do mw=1,mwaves
                if (s(mw,i) < 0.d0) then
                    amdq(m,i) = amdq(m,i) + s(mw,i)*wave(m,mw,i)
                else
                    apdq(m,i) = apdq(m,i) + s(mw,i)*wave(m,mw,i)
                endif
            enddo
        enddo
    enddo
    go to 900

!    -----------------------------------------------


    110 continue

!     # With entropy fix
!     ------------------

!    # compute flux differences amdq and apdq.
!    # First compute amdq as sum of s*wave for left going waves.
!    # Incorporate entropy fix by adding a modified fraction of wave
!    # if s should change sign.

    do 200 i=2-mbc,mx+mbc
              
        ! ------------------------------------------------------
        ! # check 1-wave:
        ! ---------------
    
        ! # u-c in left state (cell i-1)
        s0 = qr(2,i-1)/qr(1,i-1) - dsqrt(grav*qr(1,i-1))
                 
        ! # check for fully supersonic case:
        if (s0 >= 0.d0 .AND. s(1,i) > 0.d0)  then
            !            # everything is right-going
            do 60 m=1,2
                amdq(m,i) = 0.d0
            60 END DO
            go to 200
        endif
    
        !        # u-c to right of 1-wave
        hr1  = qr(1,i-1) + wave(1,1,i)
        uhr1 = qr(2,i-1) + wave(2,1,i)
        s1 =  uhr1/hr1 - dsqrt(grav*hr1)
                         
        if (s0 < 0.d0 .AND. s1 > 0.d0) then
            !            # transonic rarefaction in the 1-wave
            sfract = s0 * (s1-s(1,i)) / (s1-s0)
        else if (s(1,i) < 0.d0) then
            !	     # 1-wave is leftgoing
            sfract = s(1,i)
        else
            !	     # 1-wave is rightgoing
            sfract = 0.d0   !# this shouldn't happen since s0 < 0
        endif

        do m=1,2
            amdq(m,i) = sfract*wave(m,1,i)
            enddo
          
        ! -------------------------------------------------------
        ! # check 2-wave:
        ! ---------------
        !        # u+c in right state  (cell i)
        s3 = ql(2,i)/ql(1,i) + dsqrt(grav*ql(1,i))
                      
        !        # u+c to left of 2-wave
        hl2  = ql(1,i) - wave(1,2,i)
        uhl2 = ql(2,i) - wave(2,2,i)
        s2 = uhl2/hl2 + dsqrt(grav*hl2)
                          
        if (s2 < 0.d0 .AND. s3 > 0.d0) then
            !            # transonic rarefaction in the 2-wave
            sfract = s2 * (s3-s(2,i)) / (s3-s2)
        else if (s(2,i) < 0.d0) then
            !            # 2-wave is leftgoing
            sfract = s(2,i)
        else
            !            # 2-wave is rightgoing
            go to 200
        endif
    
        do m=1,2
            amdq(m,i) = amdq(m,i) + sfract*wave(m,2,i)
            enddo

    200 enddo


!     # compute the rightgoing flux differences:
!     # df = SUM s*wave   is the total flux difference and apdq = df - amdq

    do m=1,2
        do i = 2-mbc, mx+mbc
            df = 0.d0
            do mw=1,mwaves
                df = df + s(mw,i)*wave(m,mw,i)
                enddo
            apdq(m,i) = df - amdq(m,i)
            enddo
        enddo

    900 continue
    return

    end subroutine rp1



