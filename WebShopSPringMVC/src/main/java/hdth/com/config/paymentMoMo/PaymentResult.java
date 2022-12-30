package hdth.com.config.paymentMoMo;

//import com.mservice.allinone.models.PayGateResponse;
import com.mservice.shared.constants.Parameter;
import com.mservice.shared.sharedmodels.AbstractProcess;
import com.mservice.shared.sharedmodels.Environment;
import com.mservice.shared.utils.Encoder;
import hdth.com.utils.dto.PayGateResponse;

public class PaymentResult extends AbstractProcess<PayGateResponse, PayGateResponse> {


    public PaymentResult(Environment environment) {
        super(environment);
    }

    public static PayGateResponse process(Environment env, PayGateResponse momoPaymentResult) {
        try {
            PaymentResult paymentResult = new PaymentResult(env);
            //if(momoPaymentResult !=null){
                PayGateResponse responseMoMo = paymentResult.execute(momoPaymentResult);
                return responseMoMo;
            //}
        } catch (Exception exception) {
           // LogUtils.error("[Process Payment Result] "+ exception);
        }
        return null;
    }

    @Override
    public PayGateResponse execute(PayGateResponse payGateResponse) {
        try {
            String rawData = new StringBuilder()
                    .append(Parameter.PARTNER_CODE).append("=").append(payGateResponse.getPartnerCode()).append("&")//partnercode
                    .append(Parameter.ACCESS_KEY).append("=").append(payGateResponse.getAccessKey()).append("&")// codeaccesskey
                    .append(Parameter.REQUEST_ID).append("=").append(payGateResponse.getRequestId()).append("&")
                    .append(Parameter.AMOUNT).append("=").append(payGateResponse.getAmount()).append("&")
                    .append(Parameter.ORDER_ID).append("=").append(payGateResponse.getOrderId()).append("&")
                    .append(Parameter.ORDER_INFO).append("=").append(payGateResponse.getOrderInfo()).append("&")
                    .append(Parameter.RETURN_URL).append("=").append("http://localhost:8080/WebShopSPringMVC_war/test/api/momo").append("&")
                    .append(Parameter.NOTIFY_URL).append("=").append("http://localhost:8080/WebShopSPringMVC_war/will/api/momo/api").append("&")
                    .append(Parameter.EXTRA_DATA).append("=").append(payGateResponse.getExtraData())
                    .toString();
            String signatureClient = Encoder.signHmacSHA256(rawData, partnerInfo.getSecretKey());

            //LogUtils.debug("[Payment Result] rawData: " + rawData + ", [Signature] -> " + signatureClient);
            if (signatureClient.equals(payGateResponse.getSignature())) {
                int errorCode = 0;
                String message = "Success";
                String localMessage = "Thành công";
//                Xử lý kết quả thanh toán - Process Payment Result
                PayGateResponse responseIPNMoMo = new PayGateResponse(
                        payGateResponse.getPartnerCode(),
                        payGateResponse.getAccessKey(),
                        payGateResponse.getOrderId(),
                        payGateResponse.getOrderInfo(),
                        payGateResponse.getAmount(),
                        payGateResponse.getSignature(),
                        payGateResponse.getExtraData(),
                        payGateResponse.getRequestId(),
                        payGateResponse.getRequestType(),
                        errorCode,
                        message,
                        localMessage,
                        payGateResponse.getTransId());

                return responseIPNMoMo;
            }
            PayGateResponse responseIPNMoMo = new PayGateResponse(
                    payGateResponse.getPartnerCode(),
                    payGateResponse.getAccessKey(),
                    payGateResponse.getOrderId(),
                    payGateResponse.getOrderInfo(),
                    payGateResponse.getAmount(),
                    payGateResponse.getSignature(),
                    payGateResponse.getExtraData(),
                    payGateResponse.getRequestId(),
                    payGateResponse.getRequestType(),101, "error", "Lỗi",
                    payGateResponse.getTransId());
//          200 - Everything will be 200 Oke
            return responseIPNMoMo;
        } catch (Exception exception) {
            //LogUtils.error("[Payment Result] " + exception);
            throw new IllegalArgumentException("Invalid params capture MoMo Request");
        }
    }

}
