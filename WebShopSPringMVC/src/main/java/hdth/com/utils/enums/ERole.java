package hdth.com.utils.enums;

public enum ERole {

    ROLE_ADMIN("Quản trị viên"), ROLE_USER("khách hàng"), ROLE_SHIPPER("Người giao hàng");

    private String value;
    ERole(String value){
        this.value=value;
    }

}
