package hdth.com.controller.restAPI;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserResponse {
    private String addressDefault;
    private String fullName;
    private String phone;
    private String email;
}
