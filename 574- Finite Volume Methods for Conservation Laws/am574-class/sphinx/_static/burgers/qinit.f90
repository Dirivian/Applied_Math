subroutine qinit(meqn,mbc,mx,xlower,dx,q,maux,aux)

    ! Set initial conditions for the q array.

    implicit none
    
    integer, intent(in) :: meqn,mbc,mx,maux
    real(kind=8), intent(in) :: xlower,dx
    real(kind=8), intent(in) :: aux(maux,1-mbc:mx+mbc)
    real(kind=8), intent(inout) :: q(meqn,1-mbc:mx+mbc)

    real(kind=8) :: xcell
    integer :: i

    real(kind=8) :: q1,q2
    common /comic/ q1,q2
    
    do i=1,mx
       xcell = xlower + (i-0.5d0)*dx  ! midpoint of cell
       if (xcell .lt. 0.d0) then
           q(1,i) = q1
         else
           q(1,i) = q2
         endif
       enddo

end subroutine qinit
