program main
	real*8 x
	real*8 p(60000)
	integer maxnp
	character*80 A

	dt=0.01d0
	open (55, file="Gconfig.ini")
	read(55,*)
	read(55,*) maxnp
	read(55,*) 
	read(55,*) UD
	read(55,*) 
	read(55,*)	NS
	read(55,*) 
	read(55,*) EW
	close(55)
	!maxnp=7500
	np=maxnp
	!UD=46
	!NS=2909
	!EW=5772

	p=0
	open (55,file='or.txt')
	do I=1, UD
		read (55,*)
	end do
	!read(55,*) p(1:np)
	do I=1, np/8	
		!write(*,*) I
		!read(55,'(A80)') A
		!write(*,'(A80)') A
		!pause
		read(55,'(8f10.5)') p((i-1)*8+1:(i-1)*8+8)
		!write(*,'(8f10.5)') p((i-1)*8+1:(i-1)*8+8)
	end do
	
	close(55)

	if(maxnp>np) p(np+1:maxnp)=0.d0	
	x=100
	p=p/x	
	open (55,file="UD.txt")
		write(55,*) maxnp/2
		do i=1, maxnp/2	
		write(55,*) (real(i)-1)*dt, p(2*(i)-1)		
		end do
	close(55)	

!================

	p=0
	open (55,file='or.txt')
	do I=1, NS
		read (55,*)
	end do	
	!read(55,*) p(1:np)
	do I=1, np/8	
		!write(*,*) I
		!read(55,'(A80)') A
		!write(*,'(A80)') A
		!pause
		read(55,'(8f10.5)') p((i-1)*8+1:(i-1)*8+8)
		!write(*,'(8f10.5)') p((i-1)*8+1:(i-1)*8+8)
	end do	
	
	close(55)
	if(maxnp>np) p(np+1:maxnp)=0.d0	
	p(np+1:maxnp)=0.d0
	x=100
	p=p/x	
	open (55,file="NS.txt")
		write(55,*) maxnp/2
		do i=1, maxnp/2	
		write(55,*) (real(i)-1)*dt, p(2*(i)-1)			
		end do
	close(55)	
	
!!!!!!!!!!!!!!!!!!!!
	p=0
	open (55,file='or.txt')
	do I=1, EW
		read (55,*)
	end do	
		!read(55,*) p(1:np)
	do I=1, np/8	
		!write(*,*) I
		!read(55,'(A80)') A
		!write(*,'(A80)') A
		!pause
		read(55,'(8f10.5)') p((i-1)*8+1:(i-1)*8+8)
		!write(*,'(8f10.5)') p((i-1)*8+1:(i-1)*8+8)
	end do	
	
	close(55)
	if(maxnp>np) p(np+1:maxnp)=0.d0	
	p(np+1:maxnp)=0.d0
	x=100
	p=p/x	
	open (55,file="EW.txt")
		write(55,*) maxnp/2
		do i=1, maxnp/2	
		write(55,*) (real(i)-1)*dt, p(2*(i)-1)			
		end do
	close(55)	

	stop
end 
