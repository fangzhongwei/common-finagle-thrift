namespace java com.jxjxgo.edcenter.rpc.domain
#@namespace scala com.jxjxgo.edcenter.rpc.domain

struct EncryptResponse {
        1: string code = "",
		2: string ticket = "",
}

struct DecryptResponse {
        1: string code = "",
        2: string raw = "",
}

service EdServiceEndpoint {
        EncryptResponse encrypt(1: string traceId, 2: string raw),
        DecryptResponse decrypt(1: string traceId, 2: string ticket),
}

