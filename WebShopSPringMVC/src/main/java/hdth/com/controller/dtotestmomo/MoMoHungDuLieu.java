package hdth.com.controller.dtotestmomo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MoMoHungDuLieu {

    private String partnerCode;
    private  String accessKey;
    private String requestId;
    private String orderId;
    private long amount;
    private String orderInfo;
    private String orderType;
    private String transId;
    private int errorCode;
    private String message;
    private String localMessage;
    private String payType;
    private String responseTime;
    private String extraData;
    private String signature;
}
