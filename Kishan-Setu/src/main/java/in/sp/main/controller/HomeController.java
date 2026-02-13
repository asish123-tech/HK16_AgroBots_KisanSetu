package in.sp.main.controller;  // <--- This MUST match your folder path

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // 1. Splash Screen (Loads first)
    @GetMapping("/")
    public String showSplash() {
        return "splash"; 
    }

    // 2. Home Screen (Redirects here after 3.5s)
    @GetMapping("/home")
    public String showHome() {
        return "home"; 
    }
}