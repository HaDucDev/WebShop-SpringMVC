package hdth.com.service.impl;


import com.mservice.shared.constants.Parameter;
import com.mservice.shared.utils.Encoder;
import hdth.com.model.Order;
import hdth.com.service.PaymentMomoService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class PaymentMomoServiceImpl implements PaymentMomoService {

    @Override
    public boolean signature(Map<String, String> params) {

        if (!params.isEmpty()) {
            String partnerCode = params.get("partnerCode");
            String accessKey = params.get("accessKey");

            String requestId = params.get("requestId");
            String amount = params.get("amount");
            String orderId = params.get("orderId");
            String orderInfo = params.get("orderInfo");
//            String orderType = params.get("orderType");
//            String transId = params.get("transId");
//            String message = params.get("message");
//            String localMessage = params.get("localMessage");
//            String responseTime = params.get("responseTime");
//
//            String errorCode = params.get("errorCode");
//            String payType = params.get("payType");
            String extraData = params.get("extraData");
            String signature = params.get("signature");// lay duc chu ki gio minh so sanh ti vs thuat toan


            try {
            String rawData = new StringBuilder()
                    .append(Parameter.PARTNER_CODE).append("=").append(partnerCode).append("&")//partnercode
                    .append(Parameter.ACCESS_KEY).append("=").append(accessKey).append("&")// codeaccesskey
                    .append(Parameter.REQUEST_ID).append("=").append(requestId).append("&")
                    .append(Parameter.AMOUNT).append("=").append(amount).append("&")
                    .append(Parameter.ORDER_ID).append("=").append(orderId).append("&")
                    .append(Parameter.ORDER_INFO).append("=").append(orderInfo).append("&")
                    .append(Parameter.RETURN_URL).append("=").append("http://localhost:8080/WebShopSPringMVC_war/test/api/momo").append("&")
                    .append(Parameter.NOTIFY_URL).append("=").append("http://localhost:8080/WebShopSPringMVC_war/will/api/momo/api").append("&")
                    .append(Parameter.EXTRA_DATA).append("=").append(extraData)
                    .toString();
            String signatureClient = Encoder.signHmacSHA256(rawData, "3ByWLLOo708Ptyc5Q5CoWnngNSM4vMEy");

            if (signatureClient.equals(signature)) {
                return true;
            }
            } catch (Exception exception) {
                //LogUtils.error("[Payment Result] " + exception);
                throw new IllegalArgumentException("Invalid params capture MoMo Request");
            }


        }


        return false;
        //  }
    }

    @Override
    public String successfulTransaction(Order order) {

        return null;
    }
}
