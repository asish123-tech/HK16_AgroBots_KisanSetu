package in.sp.main.repository;

import in.sp.main.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    // Custom method to find a user by their mobile number
    User findByMobileNumber(String mobileNumber);
}