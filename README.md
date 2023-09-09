# StrixTok: Enhancing Your TikTok Shopping Experience

Welcome to StrixTok, a powerful solution that elevates your TikTok Shop experience. StrixTok integrates a cutting-edge computer vision-driven product validation tool and a social referral feature, ensuring that product reviews are reliable, informative, and engaging for potential buyers.

## Installation

Download the beta version of the app [here](https://testflight.apple.com/join/5qkKO2OO).

## Features

1. Real-time Social Purchase Bulletin
Inside TikTok Shop, users can access the "Live Board," a dynamic feature that provides real-time updates on your friends' latest purchases. With the effect of social influence and social proof, this feature encourages users to make informed buying decisions that are endorsed by their friends.

1. Interactive Review System
StrixTok introduces an interactive review system, complete with a reply feature and a voting system. This functionality fosters engaging product discussions and enhances the overall review experience.

1. Seamless TikTok Video Reviews
Product reviews in the form of captivating TikTok videos are integrated into the product pages, ensuring a harmonious user experience between TikTok's interface and TikTok Shop.

1. TikTok Coins Incentive
StrixTok proposes the use of TikTok coins as incentives for users to create high-quality reviews. Users can exchange TikTok coins for attractive cash discounts, with the reward amount determined by factors such as follower count and platform reach.

1. Discover Products: Users can also see their friends' purchase activity using the Social Purchase Bulletin in the Shop page.

1. Share Purchases: After completing a purchase, users are encouraged to share their shopping triumphs on the Social Purchase Bulletin, earning TikTok coins as a token of appreciation.

1. Leave Comprehensive Reviews: Upon receiving their purchased items, users can contribute reviews. These reviews can take the form of text, video content shared with their followers, or public video reviews. The extent of outreach directly impacts the number of TikTok coins earned.

## Preventing Abuse of Review Incentives with Advanced Computer Vision Techniques

StrixTok incorporates a robust Product Validation Computer Vision Model to thwart misuse and ensure the authenticity of reviews. Employing zero-shot learning and a CLIPSeg backbone, this model identifies the presence of the reviewed product using object segmentation and careful filtering.

Example:
- Step 1. User Gabriel posts a video review of his newly acquired headphones.
- Step 2. StrixTok's computer vision model diligently confirms that the headphones are indeed featured in the video.
- Step 3. The video is subjected to approval or rejection, and TikTok coins are distributed accordingly.
- Step 4. Users can also track whether their friends have purchased the same featured product, fostering a sense of community and shared interests.

## User Profiles

Within the user profile section, StrixTok showcases a user's purchase history and their liked items. This feature facilitates the discovery of shared interests among friends and can even serve as inspiration for thoughtful gift-giving.

## Conclusion

StrixTok has the potential to redefine the TikTok Shop experience or that of any e-commerce site, offering a more engaging, reliable, and interactive shopping journey. We invite you to explore our StrixTok app. 


---

# DevPost Description

## 💛 Introducing StrixTok 💛
🤔 🎧 As you stare at that enticing pair of headphones nestled in your online shopping cart, a barrage of questions flood your thoughts:

💭 "Does it sound as amazing as it looks?" 
"Does it LOOK as amazing as it looks on the advertisement?" 
"I wonder where my bestie Jun Jie got his headphones from last week." 
"Will the headphones truly match my vibe?" 

🛒 Decision-making can be a mess when embarking on the arduous journey of online shopping. Within the maze of uncertainties, how can you ensure that what you see is what you truly get?

🌟 **Introducing to you StrixTok, where reviews meet social engagement for an authentic and reliable shopping experience!**

## What it does
🛍️ StrixTok is a **computer vision-driven product validation tool & social referral feature integrated within TikTok Shop** that ensures that product reviews are truly of quality and reliable for potential buyers, allowing for reviews to be targeted to the buyer's followers to increase TikTok Shop traffic.

StrixTok efficaciously addresses status quo concerns of difficulties in ensuring quality and relevant reviews and lack of social integration into TikTok Shop by boosting user conversion & consumer confidence in successful purchases.

Upon product purchase and receipt from TikTok Shop, buyers are prompted to share their purchase review with their followers (textual or video, incentivised by TikTok Coins), which enables the shopper's inner circle to be informed of their purchases on a dynamic social purchase bulletin on TikTok Shop, spurring shopping FOMO among users new to TikTok Shop.

Our computer vision model steps in for the product reviews as well as advertisement-product fidelity, to ensure that the product displayed in reviews and advertisements are legitimate and exactly what the seller is selling. Coupled with the social purchase bulletin feature, this allows buyer to be more confident in their purchase decisions driving greater transaction volumes within TikTok Shop.

## How we built it
👀 The computer vision product validation model works through a zero-shot learning approach, was built with a CLIPSeg backbone to identify the presence of the reviewed item using object segmentation to select regions of interest, followed by filtering to confirm the object.

👬 The Social Commerce interface was spearheaded using Flutter to illustrate the user flow and feature implementation in the context of TikTok's UI.

## What's next for StrixTok
🌱 Besides optimisation, the scalability and refinement of the CV model is something that can be leveraged upon and applied in a variety of use cases (risk-management, tagging, content-moderation, TikTok live-tracking, recommendations, e.t.c.) and the aspect of leveraging on social involvement from existing profile followers is a great vantage point to spur greater TikTok Shop traffic through more targeted yet organic efforts.




