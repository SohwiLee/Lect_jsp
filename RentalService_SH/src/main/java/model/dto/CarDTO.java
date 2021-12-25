package model.dto;

public class CarDTO {
	int no,released,price;
	String name,size,fuel;
	
	public CarDTO(int no, String name, String size, String fuel, int released, int price) {
		this.no=no;this.name=name;this.size=size;this.fuel=fuel;this.released=released;this.price=price;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getReleased() {
		return released;
	}

	public void setReleased(int released) {
		this.released = released;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	
}
