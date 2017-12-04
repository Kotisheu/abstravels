package beans;

public class Search {
	
	private String ways;
	private String departLocation;
	private String arrivalLocation;
	private int numAdults;
	private int numChild;
	private boolean flex;
	private boolean nonstop;
	public String getWays() {
		return ways;
	}
	public void setWays(String ways) {
		this.ways = ways;
	}
	public String getDepartLocation() {
		return departLocation;
	}
	public void setDepartLocation(String departLocation) {
		this.departLocation = departLocation;
	}
	public String getArrivalLocation() {
		return arrivalLocation;
	}
	public void setArrivalLocation(String arrivalLocation) {
		this.arrivalLocation = arrivalLocation;
	}
	public int getNumAdults() {
		return numAdults;
	}
	public void setNumAdults(int numAdults) {
		this.numAdults = numAdults;
	}
	public int getNumChild() {
		return numChild;
	}
	public void setNumChild(int numChild) {
		this.numChild = numChild;
	}
	public boolean isFlex() {
		return flex;
	}
	public void setFlex(boolean flex) {
		this.flex = flex;
	}
	public boolean isNonstop() {
		return nonstop;
	}
	public void setNonstop(boolean nonstop) {
		this.nonstop = nonstop;
	}
	

}
