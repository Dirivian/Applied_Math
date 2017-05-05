subroutine qinit(meqn,mbc,mx,xlower,dx,q,maux,aux)

    ! Set initial conditions for the q array.

    ! Specify two right-going shocks with R-H condition satisfied across each

    implicit none
    
    integer, intent(in) :: meqn,mbc,mx,maux
    real(kind=8), intent(in) :: xlower,dx
    real(kind=8), intent(in) :: aux(maux,1-mbc:mx+mbc)
    real(kind=8), intent(inout) :: q(meqn,1-mbc:mx+mbc)

    real(kind=8) :: h1,u1,hu1,h2,u2,hu2,h3,u3,hu3,s12,s23,xedge
    integer :: i

    real(kind=8) :: grav
    common /cparam/ grav



    ! # data in left state:
    v1= 1.d0
    u1 = 1.d0

    ! # data in right state:
    v2= 4.d0
    u2 = 3.d0


    do i=1,mx
        xedge = xlower + (i-1)*dx
        if (xedge .lt. 0.0d0) then
            q(1,i) = v1
            q(2,i) = u1
          else 
            q(1,i) = v2
            q(2,i) = u2
          endif
        enddo

end subroutine qinit
