const testPaymentCardsJson = '''
[
    {
        "number": "4444333322221111",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "n/a",
        "behavior": "Positive authorization"
    },
    {
        "number": "5434021016824014",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "yes",
        "behavior": "Positive authorization"
    },
    {
        "number": "5598614816563766",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "yes",
        "behavior": "Positive authorization"
    },
    {
        "number": "5099802211165618",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "n/a",
        "behavior": "Positive authorization. CVV is not required in single click payments (PayU | Express)"
    },
    {
        "number": "4012001037141112",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 1",
        "isMastercardInstallments": "n/a",
        "behavior": "Positive authorization"
    },
    {
        "number": "5100052384536891",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 1",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "5150030090050083",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 1",
        "isMastercardInstallments": "no",
        "behavior": "Negative  authorization"
    },
    {
        "number": "4012001007002005",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 1",
        "isMastercardInstallments": "n/a",
        "behavior": "Negative  authorization"
    },
    {
        "number": "5000105018126595",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "no",
        "behavior": "Negative  authorization"
    },
    {
        "number": "4000398284360",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "n/a",
        "behavior": "Negative  authorization"
    },
    {
        "number": "4245757666349685",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 2 - challenge required",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "5150030090350186",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 2 - 3DS Method required",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "4012001037141120",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 2 - 3DS Method and challenge required",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "5100052384536834",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 2 - challenge params if sdk object sent in OrderCreateRequest",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "5100052384536818",
        "expirationMonth": "02",
        "expirationYear": "32",
        "cvv": "123",
        "is3DSecure": "3DS 2 - challenge required / if no 3DS is used, returns soft decline (SSD)",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "5100052384536826",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 2 - frictionless positive authentication",
        "isMastercardInstallments": "no",
        "behavior": "Positive authorization"
    },
    {
        "number": "5521455186577727",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "3DS 2 - frictionless negative authentication",
        "isMastercardInstallments": "no",
        "behavior": "no authorization (authentication fails)"
    },
    {
        "number": "5405860937270285",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "no",
        "behavior": "50% chance for successful authorization"
    },
    {
        "number": "4532598021104999",
        "expirationMonth": "12",
        "expirationYear": "29",
        "cvv": "123",
        "is3DSecure": "no",
        "isMastercardInstallments": "no",
        "behavior": "successful authorization only if amount below 1000 minor units of given currency"
    }
]
''';
