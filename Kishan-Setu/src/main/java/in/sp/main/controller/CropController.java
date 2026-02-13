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
            @RequestParam("temperature") double temp,
            @RequestParam("humidity") double humidity,
            @RequestParam("soilType") String soilType,
            @RequestParam("waterSource") String waterSource,
            Model model) {

        // 1. DEFINE CROPS
        List<CropOption> allCrops = new ArrayList<>();
        
        allCrops.add(new CropOption("Rice (Paddy)", Arrays.asList("clay", "alluvial"), Arrays.asList("canal", "rain"), 25, 35, "Requires heavy water and clay-like soil."));
        allCrops.add(new CropOption("Wheat", Arrays.asList("alluvial", "loamy"), Arrays.asList("well", "canal"), 10, 25, "Best for cool climates and moderate water."));
        allCrops.add(new CropOption("Cotton", Arrays.asList("black"), Arrays.asList("well", "canal"), 25, 35, "Black soil (Regur) is perfect for cotton."));
        allCrops.add(new CropOption("Sugarcane", Arrays.asList("alluvial", "black"), Arrays.asList("canal", "well"), 20, 30, "Long duration crop requiring good irrigation."));
        allCrops.add(new CropOption("Maize", Arrays.asList("alluvial", "red", "sandy"), Arrays.asList("rain", "well"), 18, 30, "Versatile crop, grows well in well-drained soil."));
        allCrops.add(new CropOption("Groundnut", Arrays.asList("red", "sandy"), Arrays.asList("rain", "well"), 20, 30, "Prefers loose soil for root penetration."));
        allCrops.add(new CropOption("Bajra (Millets)", Arrays.asList("sandy", "red"), Arrays.asList("rain", "well"), 25, 40, "Hardy crop, highly resistant to heat and drought."));

        // 2. SCORE THEM
        for (CropOption crop : allCrops) {
            crop.calculateScore(soilType, waterSource, temp);
        }

        // 3. SORT THEM
        allCrops.sort((c1, c2) -> Integer.compare(c2.getScore(), c1.getScore()));

        // 4. PICK TOP 3
        List<CropOption> topPicks = allCrops.subList(0, Math.min(3, allCrops.size()));

        model.addAttribute("topCrop", topPicks.get(0));
        model.addAttribute("secondCrop", topPicks.get(1));
        model.addAttribute("thirdCrop", topPicks.get(2));
        
        model.addAttribute("city", city);
        model.addAttribute("temp", temp);
        model.addAttribute("humidity", humidity);

        return "crop_result";
    }

    // --- HELPER CLASS ---
    public static class CropOption {
        // Private fields (Standard Java Practice)
        private String name;
        private int score;
        private String reason;
        
        private List<String> suitableSoils;
        private List<String> suitableWater;
        private double minTemp, maxTemp;

        public CropOption(String name, List<String> soils, List<String> water, double minT, double maxT, String reason) {
            this.name = name;
            this.suitableSoils = soils;
            this.suitableWater = water;
            this.minTemp = minT;
            this.maxTemp = maxT;
            this.reason = reason;
        }

        public void calculateScore(String userSoil, String userWater, double userTemp) {
            this.score = 0;
            
            // Soil (40%)
            if (suitableSoils.contains(userSoil)) this.score += 40;
            else if (userSoil.equals("alluvial")) this.score += 20;

            // Water (30%)
            if (suitableWater.contains(userWater)) this.score += 30;
            else if (userWater.equals("canal")) this.score += 20;

            // Temp (30%)
            if (userTemp >= minTemp && userTemp <= maxTemp) this.score += 30;
            else if (userTemp >= minTemp - 5 && userTemp <= maxTemp + 5) this.score += 10;
        }

        // --- PUBLIC GETTERS (Required for JSP) ---
        public String getName() { return name; }
        public int getScore() { return score; }
        public String getReason() { return reason; }
    }
}