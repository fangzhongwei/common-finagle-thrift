namespace java com.lawsofnature.captcha.rpc
#@namespace scala com.lawsofnature.captcha.rpc

struct GenerateCaptchaRequest {
        1: i16 captchaType = 0,
		2: i32 expireSeconds = 0,
}

struct CaptchaResponse {
        1: string code = "",
        2: string token = "",
        3: list<byte> imgBytes,
		4: i32 expireSeconds = 0,
}

struct CaptchaValidateRequest {
        1: string token = "",
        2: string text = "",
}

struct CaptchaValidateResponse {
        1: string code = "",
}

service CaptchaEndpoint {
        CaptchaResponse generateCaptcha(1: string traceId, 2: GenerateCaptchaRequest request),
        CaptchaValidateResponse validateCaptcha(1: string traceId, 2: CaptchaValidateRequest request),
}

