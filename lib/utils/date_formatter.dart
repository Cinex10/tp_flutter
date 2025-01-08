import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    // Initialisation du format selon la locale
    final DateFormat formatter = DateFormat.yMMMd();

    // Obtenir la date d'aujourd'hui
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.subtract(const Duration(days: 1));

    // Date à comparer (sans l'heure)
    final compareDate = DateTime(date.year, date.month, date.day);

    // Format relatif pour aujourd'hui/hier/demain
    if (compareDate == today) {
      return "Aujourd'hui";
    } else if (compareDate == tomorrow) {
      return "Demain";
    } else if (compareDate == yesterday) {
      return "Hier";
    }

    // Si la date est dans la même année, on n'affiche pas l'année
    if (date.year == now.year) {
      return DateFormat.MMMd().format(date);
    }

    // Format complet pour les autres dates
    return formatter.format(date);
  }

  static String formatDateTime(DateTime date, {String locale = 'fr'}) {
    final timeFormat = DateFormat.Hm(locale);
    return '${formatDate(date)} à ${timeFormat.format(date)}';
  }

  static String formatRelative(DateTime date, {String locale = 'fr'}) {
    final now = DateTime.now();
    final difference = date.difference(now);

    // Pour les dates futures
    if (difference.isNegative == false) {
      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          if (difference.inMinutes == 0) {
            return "Dans un instant";
          }
          return "Dans ${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''}";
        }
        return "Dans ${difference.inHours} heure${difference.inHours > 1 ? 's' : ''}";
      }
      if (difference.inDays < 7) {
        return "Dans ${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}";
      }
      if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return "Dans $weeks semaine${weeks > 1 ? 's' : ''}";
      }
    }
    // Pour les dates passées
    else {
      final positiveDifference = difference.abs();
      if (positiveDifference.inDays == 0) {
        if (positiveDifference.inHours == 0) {
          if (positiveDifference.inMinutes == 0) {
            return "À l'instant";
          }
          return "Il y a ${positiveDifference.inMinutes} minute${positiveDifference.inMinutes > 1 ? 's' : ''}";
        }
        return "Il y a ${positiveDifference.inHours} heure${positiveDifference.inHours > 1 ? 's' : ''}";
      }
      if (positiveDifference.inDays < 7) {
        return "Il y a ${positiveDifference.inDays} jour${positiveDifference.inDays > 1 ? 's' : ''}";
      }
      if (positiveDifference.inDays < 30) {
        final weeks = (positiveDifference.inDays / 7).floor();
        return "Il y a $weeks semaine${weeks > 1 ? 's' : ''}";
      }
    }

    // Pour les dates plus anciennes ou plus lointaines
    return formatDate(date);
  }

  static String formatDueDate(DateTime date, {String locale = 'fr'}) {
    final now = DateTime.now();
    final dueDate = DateTime(date.year, date.month, date.day);
    final today = DateTime(now.year, now.month, now.day);
    final difference = dueDate.difference(today).inDays;

    if (difference < 0) {
      return 'En retard de ${-difference} jour${-difference > 1 ? 's' : ''}';
    } else if (difference == 0) {
      return "Pour aujourd'hui";
    } else if (difference == 1) {
      return 'Pour demain';
    } else if (difference < 7) {
      return 'Dans $difference jours';
    }

    return 'Pour le ${formatDate(date)}';
  }
}
