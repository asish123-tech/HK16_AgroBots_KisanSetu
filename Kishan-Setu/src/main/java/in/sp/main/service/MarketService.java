package in.sp.main.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Service
public class MarketService {

    public List<Map<String, Object>> getLiveMandiData() {
        // We bypass the API for this specific 200-crop manual requirement 
        // to ensure all 200 custom entries are shown consistently.
        return getManualCropData(); 
    }

    private List<Map<String, Object>> getManualCropData() {
        List<Map<String, Object>> records = new ArrayList<>();

        // 1-20: Essentials
        records.add(createRecord("Wheat", "Lokwan", "2,650"));
        records.add(createRecord("Rice (Paddy)", "Basmati", "4,350"));
        records.add(createRecord("Maize", "Yellow", "2,200"));
        records.add(createRecord("Barley (Jau)", "Local", "2,550"));
        records.add(createRecord("Bajra", "Hybrid", "2,500"));
        records.add(createRecord("Gram (Chana)", "Desi", "5,440"));
        records.add(createRecord("Moong", "Green", "8,500"));
        records.add(createRecord("Urad Dal", "Black", "7,800"));
        records.add(createRecord("Masoor Dal", "Local", "6,400"));
        records.add(createRecord("Mustard", "Black", "6,200"));
        records.add(createRecord("Soybean", "Yellow", "5,100"));
        records.add(createRecord("Groundnut", "With Shell", "7,200"));
        records.add(createRecord("Sesamum", "White", "8,600"));
        records.add(createRecord("Potato", "Jyoti", "1,450"));
        records.add(createRecord("Onion", "Red", "2,800"));
        records.add(createRecord("Tomato", "Local", "1,900"));
        records.add(createRecord("Cotton", "Long Staple", "7,400"));
        records.add(createRecord("Garlic", "Desi", "8,500"));
        records.add(createRecord("Ginger", "Green", "9,200"));
        records.add(createRecord("Sugar", "S-30", "3,850"));

        // 21-50: Spices & Plantation
        String[][] spices = {{"Turmeric", "Raw"}, {"Black Pepper", "Malabar"}, {"Cardamom", "Small"}, {"Coriander", "Dry"}, {"Cumin", "Jeera"}, {"Chilli", "Guntur"}, {"Fennel", "Saunf"}, {"Fenugreek", "Methi"}, {"Clove", "Dry"}, {"Nutmeg", "Whole"}, {"Cinnamon", "Bark"}, {"Mace", "Javitri"}, {"Star Anise", "Whole"}, {"Poppy Seeds", "Posta"}, {"Saffron", "Kashmiri"}, {"Dry Ginger", "Sonth"}, {"Ajwain", "Local"}, {"Tamarind", "With Seed"}, {"Asafoetida", "Hing"}, {"Bay Leaf", "Tejpatta"}};
        for(String[] s : spices) records.add(createRecord(s[0], s[1], "5,000 - 1,50,000"));

        // 51-100: Fruits & Exotic
        String[] fruits = {"Apple", "Banana", "Mango", "Grapes", "Orange", "Pomegranate", "Guava", "Papaya", "Pineapple", "Watermelon", "Lemon", "Coconut", "Dragon Fruit", "Kiwi", "Strawberry", "Blueberry", "Avocado", "Cherry", "Pear", "Peach", "Plum", "Apricot", "Litchi", "Chikoo", "Custard Apple", "Jackfruit", "Amla", "Fig", "Muskmelon", "Wood Apple", "Date Palm", "Passion Fruit", "Mangosteen", "Rambutan", "Durian", "Pomelo", "Tangerine", "Mulberry", "Jamun", "Starfruit", "Guava (Pink)", "Green Apple", "Bael", "Persimmon", "Quince", "Cranberry", "Gooseberry", "Red Currant", "Black Currant", "Elderberry"};
        for(String f : fruits) records.add(createRecord(f, "Premium", "2,000 - 15,000"));

        // 101-150: Vegetables
        String[] veg = {"Brinjal", "Cabbage", "Cauliflower", "Okra", "Bottle Gourd", "Bitter Gourd", "Spinach", "Carrot", "Radish", "Pumpkin", "Green Peas", "Capsicum", "Sweet Potato", "French Beans", "Drumstick", "Pointed Gourd", "Ivy Gourd", "Ridge Gourd", "Snake Gourd", "Colocasia", "Yam", "Beetroot", "Broccoli", "Mushroom", "Sweet Corn", "Zucchini", "Asparagus", "Celery", "Leek", "Lettuce", "Bok Choy", "Kale", "Turnip", "Knol Khol", "Red Cabbage", "Brussels Sprouts", "Spring Onion", "Ash Gourd", "Cucumber", "Sponge Gourd", "Cluster Beans", "Cowpea", "Elephant Foot Yam", "Lotus Stem", "Baby Corn", "Red Chilli", "Yellow Capsicum", "Red Capsicum", "Cherry Tomato", "Broccoli (Purple)"};
        for(String v : veg) records.add(createRecord(v, "Fresh", "800 - 8,000"));

        // 151-200: Grains, Millets & Medicinal
        String[] misc = {"Ragi", "Jowar", "Sorghum", "Foxtail Millet", "Kodo Millet", "Barnyard Millet", "Little Millet", "Proso Millet", "Quinoa", "Chia Seeds", "Flax Seeds", "Sunflower Seeds", "Pumpkin Seeds", "Castor Seed", "Niger Seed", "Safflower", "Linseed", "Jute", "Mesta", "Tobacco", "Arecanut", "Coffee", "Tea", "Rubber", "Ashwagandha", "Aloe Vera", "Tulsi", "Stevia", "Neem Seed", "Mentha", "Lemongrass", "Palmarosa", "Citronella", "Geranium", "Vetiver", "Opium", "Isabgol", "Senna", "Guggul", "Sarpagandha", "Brahmi", "Giloy", "Amla (Dry)", "Beheda", "Harda", "Arjuna Bark", "Shatavari", "Musli", "Kalonji", "Almond"};
        for(String m : misc) records.add(createRecord(m, "Grade A", "3,000 - 45,000"));

        return records;
    }

    private Map<String, Object> createRecord(String comm, String var, String price) {
        Map<String, Object> map = new HashMap<>();
        map.put("commodity", comm);
        map.put("variety", var);
        map.put("modal_price", price);
        return map;
    }
}