package org.springframework.nextgen.model;

public class Country {

	private String name;
	
	private String latitude;
	
	private String longitude;

	private String imageUrl;
	
	
	public Country(String name, String latitude, String longitude) {
		super();
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public Country(String name, String latitude, String longitude,String imageUrl) {
		super();
		this.name = name;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imageUrl = imageUrl;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
}
