#!/bin/bash

# Ορισμός δίσκων
SOURCE_DISK="/dev/sda"  # Ο κύριος δίσκος του λειτουργικού συστήματος
TARGET_DISK="/dev/sdb"   # Ο δίσκος-στόχος για κλωνοποίηση

# Ορισμός αρχείου καταγραφής
LOG_FILE="BackUp.log"

# Συνάρτηση καταγραφής μηνυμάτων στο αρχείο log
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Έλεγχος αν οι δίσκοι υπάρχουν
if [ ! -b "$SOURCE_DISK" ]; then
  log "Σφάλμα: Ο δίσκος πηγής $SOURCE_DISK δεν βρέθηκε."
  exit 1
fi

if [ ! -b "$TARGET_DISK" ]; then
  log "Σφάλμα: Ο δίσκος στόχος $TARGET_DISK δεν βρέθηκε."
  exit 1
fi

log "Ξεκινά η κλωνοποίηση από $SOURCE_DISK σε $TARGET_DISK..."

# Χρήση της dd για την κλωνοποίηση και αποθήκευση εξόδου σε BackUp.log
if sudo dd if="$SOURCE_DISK" of="$TARGET_DISK" bs=64K conv=noerror,sync status=progress >> "$LOG_FILE" 2>&1; then
  log "Η κλωνοποίηση ολοκληρώθηκε με επιτυχία από $SOURCE_DISK σε $TARGET_DISK."
else
  log "Σφάλμα: Η κλωνοποίηση απέτυχε. Ελέγξτε το αρχείο καταγραφής για λεπτομέρειες."
  exit 1
fi
