package org.springframework.nextgen.utils;
import java.util.HashMap;
import java.util.Map;

import org.springframework.nextgen.model.Country;


public class CountryCityUtils {

	
	private static Map<String, Country> map = new HashMap<String, Country>();
	
	private static Country COUNTRY_AUSTRALIA = new Country("Australia", "-25.274398", "133.775136");
	private static Country COUNTRY_AUSTRIA = new Country("Austria", "47.516231","14.550072");
	private static Country COUNTRY_BELARUS = new Country("Belarus", "53.709807","27.953389");
	
	private static Country COUNTRY_BELGIUM = new Country("Belgium", "50.503887", "4.469936");
	private static Country COUNTRY_BRAZIL = new Country("Brazil", "-14.235004","-51.92528");
	
	private static Country COUNTRY_CANADA = new Country("Canada","56.130366","-106.346771");	
	private static Country COUNTRY_CHILE = new Country("Chile", "-35.675147","-71.542969");
	
	private static Country COUNTRY_CHINA = new Country("China", "35.86166","104.195397");
	private static Country COUNTRY_COLOMBIA = new Country("Colombia", "4.570868","-74.297333");
	private static Country COUNTRY_DENMARK = new Country("Denmark", "56.26392","9.501785");
	private static Country COUNTRY_FINLAND = new Country("Finland", "61.92411","25.748151");
	private static Country COUNTRY_FRANCE = new Country("France", "46.227638","2.213749");
	private static Country COUNTRY_GERMANY = new Country("Germany", "51.165691","10.451526");
	
	private static Country COUNTRY_HONGKONG= new Country("Hong_Kong", "22.396428","114.109497");
	private static Country COUNTRY_IRELAND = new Country("Ireland", "53.41291","-8.24389");
	private static Country COUNTRY_ITALY = new Country("Italy", "41.87194","12.56738");
	private static Country COUNTRY_JAPAN = new Country("Japan", "36.204824", "138.252924");
	
	private static Country COUNTRY_MEXICO = new Country("Mexico", "23.634501","-102.552784");
	private static Country COUNTRY_NETHERLANDS = new Country("Netherlands", "52.132633","5.291266");
	
	private static Country COUNTRY_NORWAY = new Country("Norway", "60.472024","8.468946");
	private static Country COUNTRY_NEW_ZEALAND = new Country("New_Zealand", "42.0000", "174.0000");
	
		
	
	
	private static Country COUNTRY_POLAND = new Country("Poland", "51.919438","19.145136");
	private static Country COUNTRY_PORTUGAL = new Country("Portugal", "39.399872","-8.224454");
	
	
	private static Country COUNTRY_RUSSIAN_FEDERATION = new Country("Russian_Federation", "61.52401", "105.318756");
	private static Country COUNTRY_SPAIN = new Country("Spain", "40.463667","-3.74922");
	private static Country COUNTRY_SWEDEN = new Country("Sweden", "60.128161","18.643501");
	private static Country COUNTRY_SWITZERLAND = new Country("Switzerland", "46.818188","8.227512");
	private static Country COUNTRY_TAIWAN = new Country("Taiwan", "23.69781","120.960515");
	
	private static Country COUNTRY_TURKEY = new Country("Turkey","38.963745","35.243322");
	private static Country COUNTRY_UKRAINE = new Country("Ukraine", "48.379433","31.16558");
	private static Country COUNTRY_UNITED_KINGDOM = new Country("United_Kingdom", "55.378051","-3.435973");
	private static Country COUNTRY_UNITED_STATES = new Country("United_States_of_America", "37.09024","-95.712891");	
	
	
	
	static  {
		  
		map.put("Australia", COUNTRY_AUSTRALIA);
		map.put("Melbourne", COUNTRY_AUSTRALIA);
		map.put("Adelaide", COUNTRY_AUSTRALIA);
		map.put("Sydney", COUNTRY_AUSTRALIA);
		
		map.put("Austria",  COUNTRY_AUSTRIA);
		map.put("Linz", COUNTRY_AUSTRIA);
		map.put("Graz",COUNTRY_AUSTRIA);
		map.put("Vienna", COUNTRY_AUSTRIA);
		map.put("Salzburg", COUNTRY_AUSTRIA);
		map.put("Innsbruck", COUNTRY_AUSTRIA);
		
		map.put("Belarus",COUNTRY_BELARUS);
		map.put("Minsk", COUNTRY_BELARUS);
		

		map.put("Belgium", COUNTRY_BELGIUM);
		map.put("Liège",COUNTRY_BELGIUM);
		map.put("Brussels",COUNTRY_BELGIUM);
		map.put("Antwerp", COUNTRY_BELGIUM);
		map.put("Charleroi",COUNTRY_BELGIUM);
		map.put("Ghent", COUNTRY_BELGIUM);

		 
		
		map.put("Brazil", COUNTRY_BRAZIL);
		map.put("Belém", COUNTRY_BRAZIL);
		map.put("Curitiba", COUNTRY_BRAZIL);
		map.put("Brasília", COUNTRY_BRAZIL);
		map.put("Belo Horizonte", COUNTRY_BRAZIL);
		map.put("Salvador",COUNTRY_BRAZIL);
		map.put("Fortaleza", COUNTRY_BRAZIL);
		map.put("Rio de Janeiro", COUNTRY_BRAZIL);
		map.put("Recife", COUNTRY_BRAZIL);
		map.put("Manaus", COUNTRY_BRAZIL);
		map.put("Porto Alegre",COUNTRY_BRAZIL);
		map.put("São Paulo",COUNTRY_BRAZIL);
		 
		 
		map.put("Canada", COUNTRY_CANADA);
		map.put("Toronto", COUNTRY_CANADA);
		map.put("Quebec", COUNTRY_CANADA);
		map.put("Montreal",COUNTRY_CANADA);
		map.put("Ottawa",COUNTRY_CANADA);
		map.put("Halifax", COUNTRY_CANADA);
		map.put("Vancouver", COUNTRY_CANADA);
		map.put("Edmonton",COUNTRY_CANADA);
		map.put("Saskatoon", COUNTRY_CANADA);
		map.put("Calgary",COUNTRY_CANADA);
		map.put("Winnipeg",COUNTRY_CANADA);
		
		
		map.put("Chile", COUNTRY_CHILE);
		map.put("Santiago", COUNTRY_CHILE);
		map.put("Valparaíso", COUNTRY_CHILE);
			 
		 
		 
		map.put("China", COUNTRY_CHINA);
		map.put("Changsha", COUNTRY_CHINA);
		map.put("Chongqing", COUNTRY_CHINA);
		map.put("Guangzhou",COUNTRY_CHINA);
		map.put("Shanghai", COUNTRY_CHINA);
		map.put("Tianjin",COUNTRY_CHINA);
		map.put("Beijing", COUNTRY_CHINA);
			
		map.put("Colombia",COUNTRY_COLOMBIA);
		map.put("Bogotá", COUNTRY_COLOMBIA);
			
		map.put("Denmark", COUNTRY_DENMARK);
		map.put("Copenhagen", COUNTRY_DENMARK);

		map.put("Finland",COUNTRY_FINLAND);
		map.put("Helsinki", COUNTRY_FINLAND);
		  
		 
		map.put("France",COUNTRY_FRANCE);
		map.put("Montpellier",COUNTRY_FRANCE);
		map.put("Nancy", COUNTRY_FRANCE);
		map.put("Grenoble", COUNTRY_FRANCE);
		map.put("Toulouse", COUNTRY_FRANCE);
		map.put("Rennes", COUNTRY_FRANCE);
		map.put("Nantes", COUNTRY_FRANCE);
		map.put("Nice",COUNTRY_FRANCE);
		map.put("Bordeaux", COUNTRY_FRANCE);
		map.put("Lille", COUNTRY_FRANCE);
		map.put("Marseille", COUNTRY_FRANCE);
		map.put("Strasbourg", COUNTRY_FRANCE);
		map.put("Lyon",COUNTRY_FRANCE);
		map.put("Metz", COUNTRY_FRANCE);
		map.put("Paris", COUNTRY_FRANCE);
		map.put("Clermont-Ferrand",COUNTRY_FRANCE); 
		 
		map.put("Germany", COUNTRY_GERMANY);
		map.put("Rostock", COUNTRY_GERMANY);
		map.put("Dresden", COUNTRY_GERMANY);
		map.put("Frankfurt", COUNTRY_GERMANY);
		map.put("Bremen",COUNTRY_GERMANY);
		map.put("Munich", COUNTRY_GERMANY);
		map.put("Berlin", COUNTRY_GERMANY);
		map.put("Stuttgart", COUNTRY_GERMANY);
		map.put("Munich", COUNTRY_GERMANY);
		map.put("Magdeburg", COUNTRY_GERMANY);
		map.put("Hamburg",COUNTRY_GERMANY);  
		 
		map.put("Hong Kong", COUNTRY_HONGKONG);

		map.put("Ireland", COUNTRY_IRELAND);
		map.put("Dublin", COUNTRY_IRELAND); 
		map.put("Belfast", COUNTRY_IRELAND); 	
		 
		map.put("Italy", COUNTRY_ITALY);
		map.put("Turin",COUNTRY_ITALY);
		map.put("Florence", COUNTRY_ITALY);
		map.put("Milan", COUNTRY_ITALY);
		map.put("Rome", COUNTRY_ITALY);
		map.put("Bologna", COUNTRY_ITALY);
		map.put("Bari", COUNTRY_ITALY);
		map.put("Naples", COUNTRY_ITALY);
		map.put("Genoa", COUNTRY_ITALY);
		map.put("Palermo",COUNTRY_ITALY);
	
		
		map.put("Japan", COUNTRY_JAPAN);
		map.put("Niigata",COUNTRY_JAPAN);
		map.put("Saitama", COUNTRY_JAPAN);
		map.put("Fukuoka",COUNTRY_JAPAN);
		map.put("Kyoto", COUNTRY_JAPAN);
		map.put("Sapporo", COUNTRY_JAPAN);
		map.put("Shizuoka",COUNTRY_JAPAN);
		map.put("Nagoya",COUNTRY_JAPAN);
		map.put("Tokyo", COUNTRY_JAPAN);
		map.put("Hiroshima", COUNTRY_JAPAN);
		map.put("Sendai",COUNTRY_JAPAN);
		map.put("Kobe", COUNTRY_JAPAN);
		map.put("Osaka", COUNTRY_JAPAN);
	  
		
		map.put("Mexico", COUNTRY_MEXICO);
		map.put("Tijuana",COUNTRY_MEXICO);
		map.put("Mexico City",COUNTRY_MEXICO);
		map.put("Guadalajara", COUNTRY_MEXICO);
		map.put("Ciudad Juárez", COUNTRY_MEXICO);
		map.put("Mexicali ", COUNTRY_MEXICO);
		map.put("Puebla", COUNTRY_MEXICO);
		map.put("Monterrey", COUNTRY_MEXICO);
		map.put("Villahermosa", COUNTRY_MEXICO);
		map.put("Mérida",COUNTRY_MEXICO);

		 
		map.put("Netherlands", COUNTRY_NETHERLANDS);
		map.put("Amsterdam", COUNTRY_NETHERLANDS);
		
		map.put("New Zealand",COUNTRY_NEW_ZEALAND);
		map.put("Wellington", COUNTRY_NEW_ZEALAND);
		map.put("Auckland", COUNTRY_NEW_ZEALAND);
		map.put("Christchurch", COUNTRY_NEW_ZEALAND);

		map.put("Norway", COUNTRY_NORWAY);
		map.put("Bergen",COUNTRY_NORWAY);
		map.put("Oslo", COUNTRY_NORWAY);


	 
		map.put("Poland", COUNTRY_POLAND);
		map.put("Lódz", COUNTRY_POLAND);
		map.put("Poznan", COUNTRY_POLAND);
		map.put("Gdansk", COUNTRY_POLAND);
		map.put("Szczecin", COUNTRY_POLAND);
		map.put("Warsaw", COUNTRY_POLAND);
		map.put("Cracow", COUNTRY_POLAND);
		map.put("Wroclaw", COUNTRY_POLAND);
		map.put("Katowice", COUNTRY_POLAND);
		  
	
		 
		map.put("Portugal", COUNTRY_PORTUGAL);
		map.put("Porto", COUNTRY_PORTUGAL);
		map.put("Matosinhos", COUNTRY_PORTUGAL);
		map.put("Coimbra", COUNTRY_PORTUGAL);
		map.put("Vila Nova de Gaia", COUNTRY_PORTUGAL);
		map.put("Setúbal", COUNTRY_PORTUGAL);
		map.put("Faro", COUNTRY_PORTUGAL);
		map.put("Évora", COUNTRY_PORTUGAL);
		map.put("Braga", COUNTRY_PORTUGAL);
		map.put("Aveiro",COUNTRY_PORTUGAL);
		map.put("Bragança",COUNTRY_PORTUGAL );
		map.put("Lisbon", COUNTRY_PORTUGAL);
		 


		map.put("Russian Federation", COUNTRY_RUSSIAN_FEDERATION);
		map.put("Moscow",  COUNTRY_RUSSIAN_FEDERATION);
		map.put("Penza",  COUNTRY_RUSSIAN_FEDERATION);
		map.put("Ufa",  COUNTRY_RUSSIAN_FEDERATION);
		map.put("Ekaterinburg",  COUNTRY_RUSSIAN_FEDERATION);
		map.put("Ryazan",  COUNTRY_RUSSIAN_FEDERATION);
		map.put("Saint Petersburg",  COUNTRY_RUSSIAN_FEDERATION);
		

		map.put("Spain", COUNTRY_SPAIN);
		map.put("Salamanca", COUNTRY_SPAIN);
		map.put("Oviedo", COUNTRY_SPAIN);
		map.put("Gijón", COUNTRY_SPAIN);
		map.put("Alicante", COUNTRY_SPAIN);
		map.put("Murcia", COUNTRY_SPAIN);
		map.put("Barcelona", COUNTRY_SPAIN);
		map.put("Bilbao", COUNTRY_SPAIN);
		map.put("Madrid", COUNTRY_SPAIN);
		map.put("Granada", COUNTRY_SPAIN);
		map.put("Burgos", COUNTRY_SPAIN);
		map.put("A Coruña", COUNTRY_SPAIN);
		map.put("Seville", COUNTRY_SPAIN);
		map.put("Zaragoza", COUNTRY_SPAIN);
		map.put("Valencia", COUNTRY_SPAIN);
	  
		  
		map.put("Sweden", COUNTRY_SWEDEN);
		map.put("Uppsala", COUNTRY_SWEDEN);
		map.put("Västerås", COUNTRY_SWEDEN);
		map.put("Stockholm", COUNTRY_SWEDEN);
		map.put("Linköping", COUNTRY_SWEDEN);
		map.put("Gothenburg", COUNTRY_SWEDEN);
		map.put("Malmö", COUNTRY_SWEDEN);
		map.put("Umeå", COUNTRY_SWEDEN);
	
	 
		map.put("Switzerland", COUNTRY_SWITZERLAND);
		map.put("Berne", COUNTRY_SWITZERLAND);
		map.put("Lausanne", COUNTRY_SWITZERLAND);
		map.put("St. Gallen", COUNTRY_SWITZERLAND);
		map.put("Lucerne", COUNTRY_SWITZERLAND);
		map.put("Basel", COUNTRY_SWITZERLAND);
		map.put("Zurich", COUNTRY_SWITZERLAND);
		map.put("Geneva", COUNTRY_SWITZERLAND);
		map.put("Fribourg", COUNTRY_SWITZERLAND);
		map.put("Winterthur", COUNTRY_SWITZERLAND);
		
	  	map.put("Taiwan", COUNTRY_TAIWAN);
		map.put("Taipei", COUNTRY_TAIWAN);
	 
		
	
		map.put("Turkey", COUNTRY_TURKEY);
		map.put("Antalya", COUNTRY_TURKEY);
		map.put("Adana", COUNTRY_TURKEY);
		map.put("Istanbul", COUNTRY_TURKEY);
		map.put("Ankara", COUNTRY_TURKEY);
		map.put("Izmir", COUNTRY_TURKEY);
		map.put("Bursa", COUNTRY_TURKEY);
		 
		  
		map.put("Ukraine", COUNTRY_UKRAINE);
		map.put("Kyiv", COUNTRY_UKRAINE);
		map.put("Odesa", COUNTRY_UKRAINE);

		 	
		map.put("United Kingdom", COUNTRY_UNITED_KINGDOM);
		map.put("London", COUNTRY_UNITED_KINGDOM);
		map.put("Cardiff", COUNTRY_UNITED_KINGDOM);
		map.put("Newport", COUNTRY_UNITED_KINGDOM);
		map.put("Bristol", COUNTRY_UNITED_KINGDOM);
		map.put("Birmingham", COUNTRY_UNITED_KINGDOM);
		map.put("Brighton", COUNTRY_UNITED_KINGDOM);
		map.put("Liverpool", COUNTRY_UNITED_KINGDOM);
		map.put("Southampton", COUNTRY_UNITED_KINGDOM);
		map.put("Leeds", COUNTRY_UNITED_KINGDOM);
		map.put("Plymouth", COUNTRY_UNITED_KINGDOM);
		map.put("Aberdeen", COUNTRY_UNITED_KINGDOM);
		map.put("Exeter", COUNTRY_UNITED_KINGDOM);
		map.put("Manchester", COUNTRY_UNITED_KINGDOM);
		map.put("Newcastle", COUNTRY_UNITED_KINGDOM);
		map.put("Glasgow", COUNTRY_UNITED_KINGDOM);
		map.put("Edinburgh", COUNTRY_UNITED_KINGDOM);
		map.put("Nottingham", COUNTRY_UNITED_KINGDOM);	
			
		map.put("United States",COUNTRY_UNITED_STATES);
	 	map.put("Orlando",COUNTRY_UNITED_STATES);
	 	map.put("Tampa",COUNTRY_UNITED_STATES);
	 	map.put("El Paso",COUNTRY_UNITED_STATES);
	 	map.put("Milwaukee",COUNTRY_UNITED_STATES);
	 	map.put("West Palm Beach",COUNTRY_UNITED_STATES);
	 	map.put("Denver",COUNTRY_UNITED_STATES);
	 	map.put("Houston",COUNTRY_UNITED_STATES);
	 	map.put("San Francisco",COUNTRY_UNITED_STATES);
	 	map.put("Sacramento",COUNTRY_UNITED_STATES);
	 	map.put("New Orleans",COUNTRY_UNITED_STATES);
	 	map.put("Pensacola",COUNTRY_UNITED_STATES);
	 	map.put("Little Rock",COUNTRY_UNITED_STATES);
	 	map.put("Memphis",COUNTRY_UNITED_STATES);
	 	map.put("Dallas",COUNTRY_UNITED_STATES);
	 	map.put("Atlanta",COUNTRY_UNITED_STATES);
	 	map.put("San Diego",COUNTRY_UNITED_STATES);
	 	map.put("New York",COUNTRY_UNITED_STATES);
	 	map.put("Jacksonville",COUNTRY_UNITED_STATES);
	 	map.put("San Jose",COUNTRY_UNITED_STATES);
	 	map.put("Austin",COUNTRY_UNITED_STATES);
	 	map.put("Philadelphia",COUNTRY_UNITED_STATES);
	 	map.put("Las Vegas",COUNTRY_UNITED_STATES);
	 	map.put("Portland",COUNTRY_UNITED_STATES);
	 	map.put("Boston",COUNTRY_UNITED_STATES);
	 	map.put("Miami",COUNTRY_UNITED_STATES);
	 	map.put("Phoenix",COUNTRY_UNITED_STATES);
	 	map.put("Cleveland",COUNTRY_UNITED_STATES);
	 	map.put("Los Angeles",COUNTRY_UNITED_STATES);
	 	map.put("Pittsburgh",COUNTRY_UNITED_STATES);
	 	map.put("Washington DC",COUNTRY_UNITED_STATES);
	 	map.put("Baltimore",COUNTRY_UNITED_STATES);
	 	map.put("Nashville",COUNTRY_UNITED_STATES);
	 	map.put("Columbus",COUNTRY_UNITED_STATES);
	 	map.put("Minneapolis",COUNTRY_UNITED_STATES);
	 	map.put("Virginia",COUNTRY_UNITED_STATES);
		map.put("Beach Richmond",COUNTRY_UNITED_STATES);
	 	map.put("Detroit",COUNTRY_UNITED_STATES);
	 	map.put("Chicago",COUNTRY_UNITED_STATES);
	 	map.put("St Louis",COUNTRY_UNITED_STATES);
	 	map.put("Indianapolis",COUNTRY_UNITED_STATES);
	 	map.put("Louisville",COUNTRY_UNITED_STATES);
	 	map.put("Cincinnati",COUNTRY_UNITED_STATES);
	 	map.put("Syracuse",COUNTRY_UNITED_STATES);
	 	map.put("Rochester",COUNTRY_UNITED_STATES);
		map.put("Buffalo",COUNTRY_UNITED_STATES);
		map.put("Wichita",COUNTRY_UNITED_STATES);
		map.put("Seattle",COUNTRY_UNITED_STATES); 
	
		
	}
	
	
	
	public static Country getCountry(String cityName){
		return map.get(cityName);
	}
	
	
}
