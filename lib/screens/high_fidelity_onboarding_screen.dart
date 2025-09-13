import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOnboardingScreen extends StatefulWidget {
  const HighFidelityOnboardingScreen({super.key});

  @override
  State<HighFidelityOnboardingScreen> createState() => _HighFidelityOnboardingScreenState();
}

class _HighFidelityOnboardingScreenState extends State<HighFidelityOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Based on Figma, the image occupies the top 536px, and the bottom content starts at 452px.
    // This implies an overlap, best handled by a Stack.
    const imageHeight = 536.0; // From "Image Onboarding" absoluteBoundingBox height
    const bottomContentStartOffset = 452.0; // From "Container" absoluteBoundingBox y

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, // White status bar icons
      child: Scaffold(
        backgroundColor: Colors.white, // Default background if parts are transparent
        body: Stack(
          children: [
            // 1. Background Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: imageHeight,
              child: Image.asset(
                'assets/images/I156_95_417_719.png', // Reconstructed path from image ID
                fit: BoxFit.cover,
              ),
            ),

            // 2. Bottom Content Area with Gradient Overlay
            Positioned(
              top: bottomContentStartOffset,
              left: 0,
              right: 0,
              bottom: 0, // Extends to the bottom of the screen
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x00050505), // Transparent dark grey
                      const Color(0xFF050505), // Opaque dark grey
                    ],
                    stops: const [0.0, 0.2367], // Gradient stops from Figma
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // Push content to the bottom
                    children: [
                      // Text: Fall in Love with Coffee in Blissful Delight!
                      Text(
                        'Fall in Love with Coffee in Blissful Delight!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: 32,
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                          height: 1.5, // lineHeightPx: 48, fontSize: 32 => 48/32 = 1.5
                          letterSpacing: 0.16,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02), // Spacing between title and description
                      // Text: Welcome to our cozy coffee corner...
                      Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          fontWeight: FontWeight.w400, // Regular
                          color: const Color(0xFFA2A2A2), // Grey
                          height: 1.5, // lineHeightPx: 21, fontSize: 14 => 21/14 = 1.5
                          letterSpacing: 0.14,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04), // Spacing before button

                      // Button: Get Started
                      SizedBox(
                        width: double.infinity,
                        height: 56, // Button height from Figma
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the home screen using go_router
                            context.go('/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC67C4E), // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16), // cornerRadius from Figma
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16), // padding from Figma
                            elevation: 0,
                          ),
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.w600, // SemiBold
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04), // Spacing for home indicator
                    ],
                  ),
                ),
              ),
            ),

            // 3. Home Indicator (bottom of screen)
            Positioned(
              bottom: 0, // Aligned to the very bottom
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: true,
                top: false,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8), // Adjusted margin for visual balance
                    width: 134, // Width from Figma
                    height: 5, // Height from Figma
                    decoration: BoxDecoration(
                      color: const Color(0xFF242424), // Home Indicator color
                      borderRadius: BorderRadius.circular(100), // Highly rounded corners
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}