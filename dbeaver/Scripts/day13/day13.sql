-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
--
--
--

WITH CONTACT_LIST AS (
    SELECT
        ID
        , NAME
        , UNNEST (EMAIL_ADDRESSES) AS EMAIL_ADDRESS
    FROM CONTACT_LIST CL
), CONTACT_LIST_DOMAIN AS (
    SELECT
        *
        , SPLIT_PART(EMAIL_ADDRESS, '@', 2) AS DOMAIN
    FROM CONTACT_LIST
)
SELECT DISTINCT
    DOMAIN
    , COUNT(DOMAIN) AS TOTAL_EMAILS
    , ARRAY_AGG(EMAIL_ADDRESS) AS EMAIL_ADDRESSES
FROM CONTACT_LIST_DOMAIN
GROUP BY DOMAIN
ORDER BY TOTAL_EMAILS DESC
LIMIT 1

