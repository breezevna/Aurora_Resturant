<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <body>
            <h2>Restaurant Location</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Address</th>
                    <th>City</th>
                    <th>Phone Number</th>
                </tr>
                <xsl:for-each select="/Aurora/restaurantTab/location">
                    <tr>
                        <td><xsl:value-of select="address"/></td>
                        <td><xsl:value-of select="city"/></td>
                        <td><xsl:value-of select="phoneNumber"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Restaurant Working hours</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>The day</th>
                    <th>Opens</th>
                    <th>Closes</th>
                </tr>
                <xsl:for-each select="/Aurora/restaurantTab/hours/weekday">
                    <tr>
                        <td><xsl:value-of select="theDay"/></td>
                        <td><xsl:value-of select="open"/></td>
                        <td><xsl:value-of select="close"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Restaurant Payment</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Type</th>
                    <th>cardNumber</th>
                    <th>expirationDate</th>
                    <th>cvv</th>
                    <th>Amount</th>
                </tr>
                <xsl:for-each select="/Aurora/restaurantTab/payment/paymentMethod">
                    <tr>
                        <td><xsl:value-of select="type"/></td>
                        <td><xsl:value-of select="cardNumber"/></td>
                        <td><xsl:value-of select="expirationDate"/></td>
                        <td><xsl:value-of select="cvv"/></td>
                        <td><xsl:value-of select="amount"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Restaurant Reservation</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Personas</th>
                </tr>
                <xsl:for-each select="/Aurora/reservation">
                    <tr>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="phone"/></td>
                        <td><xsl:value-of select="date"/></td>
                        <td><xsl:value-of select="time"/></td>
                        <td><xsl:value-of select="personas"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Restaurant Menu</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Category</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                </tr>
                <xsl:for-each select="//category/item">
                    <tr>
                        <td><xsl:value-of select="../@name" /></td>
                        <td><xsl:value-of select="name" /></td>
                        <td><xsl:value-of select="description" /></td>
                        <td><xsl:value-of select="price" /></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Restaurant News</h2>
            <table border="1">
                <tr bgcolor="#9acd32">
                    <th>Title</th>
                    <th>Description</th>
                </tr>
                <xsl:for-each select="/Aurora/news/article">
                    <xsl:sort select="title" order="ascending"/><!-- < Sorts titles in alphabetic order > -->
                    <tr>
                        <td><xsl:value-of select="title" /></td>
                        <td><xsl:value-of select="description" /></td>
                    </tr>
                </xsl:for-each>
            </table>

        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>