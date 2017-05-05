subroutine setprob

    ! Set any problem-specific parameters here.
    ! This is executed before any time-stepping takes place.
    !

    implicit none

    character*25 :: fname
    integer :: iunit
    logical :: efix
    real(kind=8) :: q1,q2

    common /comrp/ efix
    common /comic/ q1,q2

    iunit = 7
    fname = 'setprob.data'
    ! open the file skipping over any comment lines starting with #:
    call opendatafile(iunit, fname)

    ! Read in the values q1 and q2, passed to qinit.f90 in a common block.
    read(7,*) q1
    read(7,*) q2

    ! read the boolean efix, which is set in setrun.py
    ! and passed to the Riemann solver in a common block.
    read(7,*) efix

end subroutine setprob

