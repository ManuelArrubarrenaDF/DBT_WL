with
source as (
    SELECT users_id, 
    total_fg_time, 
  CASE
    WHEN LOWER(package_name) LIKE '%google.android%' AND LOWER(package_name) NOT LIKE '%youtube%' THEN 'android'
    WHEN LOWER(package_name) LIKE '%youtube%' THEN 'youtube'
    WHEN LOWER(package_name) LIKE '%instagram%' THEN 'instagram'
    WHEN LOWER(package_name) LIKE '%qualcomm%' THEN 'qualcomm'
    WHEN LOWER(package_name) LIKE 'android' THEN 'android'
    WHEN LOWER(package_name) LIKE 'com.android%' THEN 'android'
    WHEN LOWER(package_name) LIKE 'com.sec.android%' THEN 'android'
    WHEN LOWER(package_name) LIKE 'com.samsung.android%' THEN 'android'
    WHEN LOWER(package_name) LIKE '%twitter%' THEN 'twitter'
    WHEN LOWER(package_name) LIKE '%whatsapp%' THEN 'whatsapp'
    WHEN LOWER(package_name) LIKE '%mixplorer%' THEN 'mixplorer'
    WHEN LOWER(package_name) LIKE '%spotify%' THEN 'spotify'
    WHEN LOWER(package_name) LIKE '%vodafone%' THEN 'vodafone'
    WHEN LOWER(package_name) LIKE '%telegram%' THEN 'telegram'
    WHEN LOWER(package_name) LIKE '%sensapp%' THEN 'sensapp'
    WHEN LOWER(package_name) LIKE '%rsoft%' THEN 'rsoft'
    WHEN LOWER(package_name) LIKE '%argosoft%' THEN 'argosoft'
    WHEN LOWER(package_name) LIKE '%minecraftpe%' THEN 'minecraftpe'
    WHEN LOWER(package_name) LIKE '%robtopx%' THEN 'robtopx'
    WHEN LOWER(package_name) LIKE '%supercell%' THEN 'supercell'
    WHEN LOWER(package_name) LIKE '%studio8apps%' THEN 'studio8apps'
    WHEN LOWER(package_name) LIKE '%samsung%'
  AND LOWER(package_name) NOT LIKE '%samsung.android%' THEN 'samsung'
    WHEN LOWER(package_name) LIKE '%facebook%' THEN 'facebook'
    WHEN LOWER(package_name) LIKE '%skype%' THEN 'skype'
    WHEN LOWER(package_name) LIKE '%bluemail%' THEN 'bluemail'
    WHEN LOWER(package_name) LIKE '%videolan%' THEN 'videolan'
    WHEN LOWER(package_name) LIKE '%motorola%' THEN 'motorola'
    WHEN LOWER(package_name) LIKE '%dropbox%' THEN 'dropbox'
    WHEN LOWER(package_name) LIKE '%soundcloud%' THEN 'soundcloud'
    WHEN LOWER(package_name) LIKE '%ryanair%' THEN 'ryanair'
    WHEN LOWER(package_name) LIKE '%tripadvisor%' THEN 'tripadvisor'
    WHEN LOWER(package_name) LIKE '%booking%' THEN 'booking'
    WHEN LOWER(package_name) LIKE '%ubercab%' THEN 'ubercab'
    WHEN LOWER(package_name) LIKE '%duolingo%' THEN 'duolingo'
    WHEN LOWER(package_name) LIKE '%roomster%' THEN 'roomster'
    WHEN LOWER(package_name) LIKE '%miui%' THEN 'miui'
    WHEN LOWER(package_name) LIKE '%wikipedia%' THEN 'wikipedia'
    WHEN LOWER(package_name) LIKE '%badoo%' THEN 'badoo'
    WHEN LOWER(package_name) LIKE '%airbnb%' THEN 'airbnb'
    WHEN LOWER(package_name) LIKE '%xiaomi%' THEN 'xiaomi'
    WHEN LOWER(package_name) LIKE '%hostelworld%' THEN 'hostelworld'
    WHEN LOWER(package_name) LIKE '%linkedin%' THEN 'linkedin'
    WHEN LOWER(package_name) LIKE '%roomiapp%' THEN 'roomiapp'
    WHEN LOWER(package_name) LIKE '%tratao%' THEN 'tratao'
    WHEN LOWER(package_name) LIKE '%roommate%' THEN 'roommate'
    WHEN LOWER(package_name) LIKE '%alibaba%' THEN 'alibaba'
    WHEN LOWER(package_name) LIKE '%skyscanner%' THEN 'skyscanner'
    WHEN LOWER(package_name) LIKE '%amazon%' THEN 'amazon'
    WHEN LOWER(package_name) LIKE '%.mi.%' THEN 'mi'
    WHEN LOWER(package_name) LIKE '%yahoo%' THEN 'yahoo'
    WHEN LOWER(package_name) LIKE '%playstation%' THEN 'playstation'
    WHEN LOWER(package_name) LIKE '%trivago%' THEN 'trivago'
    WHEN LOWER(package_name) LIKE '%huawei%' THEN 'huawei'
    WHEN LOWER(package_name) LIKE '%netflix%' THEN 'netflix'
    WHEN LOWER(package_name) LIKE '%tumblr%' THEN 'tumblr'
    WHEN LOWER(package_name) LIKE '%shazam%' THEN 'shazam'
    WHEN LOWER(package_name) LIKE '%snapchat%' THEN 'snapchat'
    WHEN LOWER(package_name) LIKE '%ketchapp%' THEN 'ketchapp'
    WHEN LOWER(package_name) LIKE '%letterboxd%' THEN 'letterboxd'
    WHEN LOWER(package_name) LIKE '%translator%' THEN 'translator'
    WHEN LOWER(package_name) LIKE '%photoeditor%' THEN 'photoeditor'
    WHEN LOWER(package_name) LIKE '%asus%' THEN 'asus'
    WHEN LOWER(package_name) LIKE '%wordreference%' THEN 'wordreference'
    WHEN LOWER(package_name) LIKE '%microsoft%' THEN 'microsoft'
    WHEN LOWER(package_name) LIKE '%telecomitalia%' THEN 'telecomitalia'
    WHEN LOWER(package_name) LIKE '%gopro%' THEN 'gopro'
    WHEN LOWER(package_name) LIKE '%.ea.%' THEN 'ea'
    WHEN LOWER(package_name) LIKE '%gmail%' THEN 'gmail'
    WHEN LOWER(package_name) LIKE '%adobe%' THEN 'adobe'
    WHEN LOWER(package_name) LIKE '%antivirus%' THEN 'antivirus'
    WHEN LOWER(package_name) LIKE '%oneplus%' THEN 'oneplus'
    WHEN LOWER(package_name) LIKE '%handyapps%' THEN 'handyapps'
    WHEN LOWER(package_name) LIKE '%ebay%' THEN 'ebay'
    WHEN LOWER(package_name) LIKE '%justeat%' THEN 'justeat'
    WHEN LOWER(package_name) LIKE '%pinterest%' THEN 'pinterest'
    WHEN LOWER(package_name) LIKE '%wordgame%' THEN 'wordgame'
    WHEN LOWER(package_name) LIKE '%isitlove%' THEN 'isitlove'
    WHEN LOWER(package_name) LIKE '%voodoo%' THEN 'voodoo'
    WHEN LOWER(package_name) LIKE '%fungames%' THEN 'fungames'
    WHEN LOWER(package_name) LIKE '%mcdonalds%' THEN 'mcdonalds'
    WHEN LOWER(package_name) LIKE '%gamefox%' THEN 'gamefox'
    WHEN LOWER(package_name) LIKE '%twitch%' THEN 'twitch'
    WHEN LOWER(package_name) LIKE '%panasonic%' THEN 'panasonic'
    WHEN LOWER(package_name) LIKE '%.lge.%' THEN 'lge'
    WHEN LOWER(package_name) LIKE '%nikon%' THEN 'nikon'
    WHEN LOWER(package_name) LIKE '%.hp.%' THEN 'hp'
    WHEN LOWER(package_name) LIKE '%nikon%' THEN 'nikon'
    WHEN LOWER(package_name) LIKE '%sandbox%' THEN 'sandbox'
    WHEN LOWER(package_name) LIKE '%google.earth%' THEN 'google.earth'
    WHEN LOWER(package_name) LIKE '%mozilla%' THEN 'mozilla'
  -- REVISAR CUANDO SEA APPLE--
  ELSE
  'other'
END
  AS pack_name_root,

   FROM {{ source('IDA_MDF_raw', 'apps_usage') }}
)

SELECT *
FROM source
*/