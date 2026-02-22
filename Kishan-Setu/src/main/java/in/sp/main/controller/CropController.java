package in.sp.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.*;

@Controller
public class CropController { 

    @GetMapping("/crop-recommendation") 
    public String showCropForm() {
        return "crop_recommendation"; 
    }

    @PostMapping("/predict-crop")
    public String predictCrop(
            @RequestParam("state") String state,
            @RequestParam("city") String city,
            @RequestParam("temperature") double temperature,
            @RequestParam("humidity") double humidity,
            @RequestParam("soilType") String soilType,
            @RequestParam("phLevel") double phLevel, 
            Model model
    ) {
        
        String topCropName, topCropReason; int topScore;
        String secondName, secondReason; int secondScore;
        String thirdName, thirdReason; int thirdScore;

        // --- ENHANCED LOGIC ENGINE ---

        // 1. ACIDIC SOIL (pH < 5.5)
        if (phLevel < 5.5) {
            topCropName = "Tea"; topCropReason = "Highly acidic soil is mandatory for quality tea leaves."; topScore = 98;
            secondName = "Blueberries"; secondReason = "Thrives in low pH environments."; secondScore = 85;
            thirdName = "Potato"; thirdReason = "Tolerates acidity and resists common scab in low pH."; thirdScore = 75;
        } 
        
        // 2. ALKALINE SOIL (pH > 7.5)
        else if (phLevel > 7.5) {
            topCropName = "Barley"; topCropReason = "Most salt-tolerant cereal; perfect for alkaline soil."; topScore = 94;
            secondName = "Cotton"; secondReason = "Deep roots handle alkaline clay well."; secondScore = 88;
            thirdName = "Sugar Beet"; thirdReason = "High tolerance for pH up to 8.2."; thirdScore = 80;
        } 
        
        // 3. NEUTRAL / SLIGHTLY ACIDIC (pH 5.5 - 7.5) -> THE GOLDEN RANGE
        else {
            // Hot & Humid (Tropical)
            if (temperature > 28 && humidity > 70) {
                topCropName = "Rice (Paddy)"; topCropReason = "High heat and humidity are ideal for water-retentive soil."; topScore = 97;
                secondName = "Sugarcane"; secondReason = "Long growing season needs this tropical warmth."; secondScore = 90;
                thirdName = "Banana"; thirdReason = "Constant humidity ensures healthy fruit development."; thirdScore = 82;
            } 
            // Moderate (Sub-Tropical)
            else if (temperature >= 18 && temperature <= 28) {
                if (soilType.equalsIgnoreCase("Black")) {
                    topCropName = "Soybean"; topCropReason = "Black soil holds the moisture your region currently has."; topScore = 95;
                    secondName = "Groundnut"; secondReason = "Ideal temperature for nitrogen fixation."; secondScore = 88;
                    thirdName = "Maize (Corn)"; thirdReason = "Versatile crop for moderate sub-tropical climates."; thirdScore = 84;
                } else {
                    topCropName = "Maize"; topCropReason = "Well-drained soil and moderate temp ensure high yield."; topScore = 92;
                    secondName = "Tomato"; secondReason = "Thrives in neutral soil and pleasant weather."; secondScore = 86;
                    thirdName = "Pigeon Peas (Arhar)"; thirdReason = "Excellent for soil health and moderate climate."; thirdScore = 78;
                }
            } 
            // Cool (Temperate/Winter)
            else {
                topCropName = "Wheat"; topCropReason = "Perfect winter crop for cool, bright days."; topScore = 96;
                secondName = "Chickpeas (Gram)"; secondReason = "Requires low moisture and cool nights."; secondScore = 89;
                thirdName = "Mustard"; thirdReason = "Low water requirement and thrives in cold air."; thirdScore = 85;
            }
        }

        // --- SEND DATA TO RESULT PAGE ---
        model.addAttribute("topCrop", new Crop(topCropName, topCropReason, topScore));
        model.addAttribute("secondCrop", new Crop(secondName, secondReason, secondScore));
        model.addAttribute("thirdCrop", new Crop(thirdName, thirdReason, thirdScore));
        
        model.addAttribute("city", city);
        model.addAttribute("temp", temperature);
        model.addAttribute("soil", soilType);

        return "crop_result";
    }

    public static class Crop {
        public String name;
        public String reason;
        public int score;

        public Crop(String name, String reason, int score) {
            this.name = name;
            this.reason = reason;
            this.score = score;
        }
        
        public String getName() { return name; }
        public String getReason() { return reason; }
        public int getScore() { return score; }
    }
}