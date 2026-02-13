package in.sp.main.controller;

import in.sp.main.entity.User;
import in.sp.main.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    // --- LOGIN PAGE ---
    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String mobileNumber, 
                               @RequestParam String password, 
                               Model model) {
        User user = userRepository.findByMobileNumber(mobileNumber);

        if (user != null && user.getPassword().equals(password)) {
            return "redirect:/dashboard"; // Success: Go to dashboard
        } else {
            model.addAttribute("error", "Invalid Mobile Number or Password");
            return "login";
        }
    }

    // --- SIGNUP PAGE ---
    @GetMapping("/signup")
    public String showSignup() {
        return "signup";
    }

    @PostMapping("/signup")
    public String processSignup(@ModelAttribute User user, 
                                @RequestParam String confirmPassword, 
                                Model model) {
        // 1. Check if passwords match
        if (!user.getPassword().equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            return "signup";
        }

        // 2. Check if mobile already exists
        if (userRepository.findByMobileNumber(user.getMobileNumber()) != null) {
            model.addAttribute("error", "Mobile Number already registered!");
            return "signup";
        }

        // 3. Save User
        userRepository.save(user);
        return "redirect:/login?success=true";
    }
}