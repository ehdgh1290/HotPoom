package com.gear.hotpoom.dao;

<<<<<<< HEAD
import java.util.List;

import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.PageVO;

public interface BookingsDAO {

	public List<Booking> selectList(PageVO pageVO);
	public int selectTotal(int userNo);
	public int updateState(Booking booking);
=======
import com.gear.hotpoom.vo.Booking;

public interface BookingsDAO {

	//bill
	public Booking selectBill(String bookingNo);
	//예약 취소
	public int updateBooking(String no);
>>>>>>> 4348010f30f2f3e64a69db30de38c987ce638681
	
}
