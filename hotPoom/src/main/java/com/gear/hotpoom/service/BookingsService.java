package com.gear.hotpoom.service;

<<<<<<< HEAD
import java.util.Map;

public interface BookingsService {

	public Map<String, Object> getList(int userNo, int pageNo);

}
=======
import com.gear.hotpoom.vo.Booking;
import com.gear.hotpoom.vo.Cancel;

public interface BookingsService {

	//bill
	public Booking getBill(String bookingNo);
	//예약 취소
	public void modifyBooking(Cancel cancel);
	
}
>>>>>>> 4348010f30f2f3e64a69db30de38c987ce638681
