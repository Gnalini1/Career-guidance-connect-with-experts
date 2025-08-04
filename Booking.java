package model;

import java.time.LocalDate;

public class Booking {
    private int id;
    private int userId;
    private String expertName;
    private String serviceType;
    private LocalDate bookingDate;

    // Constructors
    public Booking() {}
    public Booking(int id, int userId, String expertName, String serviceType, LocalDate bookingDate) {
        this.id = id;
        this.userId = userId;
        this.expertName = expertName;
        this.serviceType = serviceType;
        this.bookingDate = bookingDate;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getExpertName() { return expertName; }
    public void setExpertName(String expertName) { this.expertName = expertName; }

    public String getServiceType() { return serviceType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }

    public LocalDate getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDate bookingDate) { this.bookingDate = bookingDate; }
}