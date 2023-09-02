<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/">
        {
        <!-- Location -->
        "location": [
        <xsl:apply-templates select="/Aurora/restaurantTab/location"/>
        ],

        <!-- Working Hours -->
        "workingHours": [
        <xsl:apply-templates select="/Aurora/restaurantTab/hours/weekday"/>
        ],

        <!-- Payment Method -->
        "PaymentMethod": [
        <xsl:apply-templates select="/Aurora/restaurantTab/payment/paymentMethod"/>
        ],

        <!-- Reservation -->
        "restaurantReservation": [
        <xsl:apply-templates select="/Aurora/reservation"/>
        ],

        <!-- Restaurant Menu -->
        "restaurantMenu": {
        "category": [
        <xsl:for-each select="//category">
            {
            "name": "<xsl:value-of select="@name"/>",
            "item": [
            <xsl:for-each select="item">
                {
                "name": "<xsl:value-of select="name"/>",
                "description": "<xsl:value-of select="description"/>",
                "price": "<xsl:value-of select="price"/>"
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]
        },

        <!-- News -->
        "restaurantNews": [
        <xsl:for-each select="/Aurora/news/article">
            <xsl:sort select="title" order="ascending"/>
            <xsl:if test="position() &gt; 1">
            </xsl:if>
            {
            "Title": "<xsl:value-of select="title"/>",
            "Description": "<xsl:value-of select="description"/>"
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]
        }
    </xsl:template>

    <xsl:template match="location">
        {
        "Address": "<xsl:value-of select="address"/>",
        "City": "<xsl:value-of select="city"/>",
        "PhoneNumber": "<xsl:value-of select="phoneNumber"/>"
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>

    <xsl:template match="weekday">
        {
        "TheDay": "<xsl:value-of select="theDay"/>",
        "Opens": "<xsl:value-of select="open"/>",
        "Closes": "<xsl:value-of select="close"/>"
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>

    <xsl:template match="paymentMethod">
    {
    "Type": "<xsl:value-of select="type"/>",
    "CardNumber": "<xsl:value-of select="cardNumber"/>",
    "ExpirationDate": "<xsl:value-of select="expirationDate"/>",
    "CVV": "<xsl:value-of select="cvv"/>",
    "Amount": "<xsl:value-of select="amount"/>"
    }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>

    <xsl:template match="/Aurora/reservation">
        {
        "name": "<xsl:value-of select="name"/>",
        "phone": "<xsl:value-of select="phone"/>",
        "date": "<xsl:value-of select="date"/>",
        "time": "<xsl:value-of select="time"/>",
        "personas": "<xsl:value-of select="personas"/>"
        }<xsl:if test="position() != last()">,</xsl:if>
    </xsl:template>

</xsl:stylesheet>
