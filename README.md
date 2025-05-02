QORVO_RADIO

A Modular RF Learning Platform | UNC Charlotte ECE Senior Design
📡 Overview

QORVO_RADIO is a reconfigurable software-defined radio (SDR) front-end platform designed by undergraduate engineers at the University of North Carolina at Charlotte. The goal of this project is to provide future engineering students with a hands-on, modular hardware platform to explore RF systems, signal processing, and wireless security in a lab setting.

This repository serves as a permanent archive of all project documentation, design files, firmware, and test materials originally shared via Google Drive.
🔧 What It Does

QORVO_RADIO enables students to receive and analyze radio-frequency signals across a wide bandwidth using a flexible, modular design. It supports:

    Two independent receiver paths

    Tuning range: 85 MHz to 2500 MHz

    Instantaneous bandwidth: 40 MHz per path

    Swappable RF modules for future upgrades

    Interfacing with an FPGA platform (such as the Eclypse Z7 or Pluto SDR)

    Real-time demodulation and visualization using GNU Radio

The front-end includes a complete analog signal chain:

    RF switch → Low Noise Amplifier (LNA) → Band-select filtering

    Passive mixer for down-conversion

    Driver amplifier → ADC → FPGA interface

🎯 Educational Goals

This project is more than just hardware — it's a learning tool.
Key features include:

    Open hardware schematics and layout (editable in KiCad)

    Documented test procedures for validation and debugging

    Customizable Python scripts for SPI control and data logging

    Example GNU Radio flowgraphs to visualize and process live signals

    Designed to be student-friendly, with modularity for future class integration
🏫 About the Team

This project was developed by a team of undergraduate students at UNC Charlotte in collaboration with Qorvo as part of the 2024–2025 Electrical & Computer Engineering Senior Design program. The platform is intended to remain open-source and reusable by future student teams and RF instructors.
