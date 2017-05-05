subroutine setprob

    ! Copy this file to your directory and modify to set up problem
    ! parameters or read other data.
    !

    implicit none

    character*12 fname
    integer :: iunit

    real(kind=8) :: grav
    common /cparam/ grav

    iunit = 7
    fname = 'setprob.data'
    ! open the unit, skipping over lines starting with #:
    call opendatafile(iunit, fname)
              
    ! Graviational constant g:
    read(7,*) grav

end subroutine setprob

