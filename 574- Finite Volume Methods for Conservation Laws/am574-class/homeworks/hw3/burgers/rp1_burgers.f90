! =============================================================================
subroutine rp1(maxmx,meqn,mwaves,maux,mbc,mx,ql,qr,auxl,auxr,wave,s,amdq,apdq)
! =============================================================================
!
! Riemann problems for the 1D Burgers' equation with entropy fix for 
! transonic rarefaction. See "Finite Volume Method for Hyperbolic Problems",
! R. J. LeVeque.

! waves: 1
! equations: 1

! Conserved quantities:
!       1 q
    
    implicit none

    integer, intent(in) :: maxmx, meqn, mwaves, maux, mbc, mx
    real(kind=8), intent(in), dimension(meqn,1-mbc:maxmx+mbc) :: ql, qr
    real(kind=8), intent(in), dimension(maux,1-mbc:maxmx+mbc) :: auxl, auxr
    real(kind=8), intent(out) :: s(mwaves, 1-mbc:maxmx+mbc)
    real(kind=8), intent(out) :: wave(meqn, mwaves, 1-mbc:maxmx+mbc)
    real(kind=8), intent(out), dimension(meqn,1-mbc:maxmx+mbc) :: amdq,apdq

    ! local variables:
    real(kind=8) :: qs,fs,qi,qim,fi,fim
    integer :: i

    logical :: efix
    common /comrp/ efix
 
    qs = 0.d0 ! sonic point
    fs = 0.d0 ! flux at sonic point

    do i=2-mbc,mx+mbc
        
        qim = qr(1,i-1)  ! left state for Riemann problem at i-1/2
        qi = ql(1,i)     ! right state for Riemann problem at i-1/2

        wave(1,1,i) = qi - qim

        if (qi == qim) then
            s(1,i) = qi   ! f'(q)
          else
            fim = 0.5d0*qim**2
            fi = 0.5d0*qi**2
            s(1,i) = (fi - fim) / (qi - qim)
          endif

        amdq(1,i) = dmin1(s(1,i), 0.d0) * wave(1,1,i)
        apdq(1,i) = dmax1(s(1,i), 0.d0) * wave(1,1,i)


	    if (efix) then
            if (qim < qs .and. qi > qs) then
                amdq(1,i) = fs - fim
                apdq(1,i) = fi - fs
            endif
        endif
    enddo

    end subroutine
