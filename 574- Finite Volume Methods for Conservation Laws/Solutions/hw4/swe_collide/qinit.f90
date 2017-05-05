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

    ! # data in middle state:
    h2 = 2.d0
    u2 = 0.d0
    hu2 = h2*u2

    ! # data in left state:
    h1 = 4.d0
    u1 = sqrt(0.5d0*grav*(h2/h1 - h1/h2) * (h2-h1))
    hu1 = h1*u1

    ! # data in right state:
    h3 = 0.8d0
    u3 = -sqrt(0.5d0*grav*(h2/h3 - h3/h2) * (h2-h3))
    hu3 = h3*u3

    s12 = (hu2-hu1) / (h2-h1)
    s23 = (hu2-hu3) / (h2-h3)
    write(6,*) 'shock speeds:', s12, s23

    do i=1,mx
        xedge = xlower + (i-1)*dx
        if (xedge .lt. -4.0d0) then
            q(1,i) = h1
            q(2,i) = hu1
          else if (xedge .lt. -2.5d0) then
            q(1,i) = h2
            q(2,i) = hu2
          else 
            q(1,i) = h3
            q(2,i) = hu3
          endif
        enddo

end subroutine qinit
