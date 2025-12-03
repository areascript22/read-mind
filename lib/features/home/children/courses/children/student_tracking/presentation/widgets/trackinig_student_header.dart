import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../../core/common/entities/user_entity.dart';
import '../../../../domain/entities/course_entity.dart';

class StudentHeader extends StatelessWidget {
  final UserEntity student;
  final CourseEntity course;

  final String? avatarUrl;
  final Color progressColor;
  final VoidCallback? onTap;

  const StudentHeader({
    super.key,
    required this.student,
    required this.course,

    this.avatarUrl,
    this.progressColor = Colors.green,
    this.onTap,
  });

  String get _fullName => '${student.name} ${student.lastName}';

  String get _courseCreatedInfo {
    final now = DateTime.now();
    final difference = now.difference(course.createdAt);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return 'Created $years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return 'Created $months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return 'Created ${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return 'Created ${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    }
    return 'Created recently';
  }

  Color get _emailStatusColor {
    return student.emailVerified ? Colors.green[700]! : Colors.orange[700]!;
  }

  String? get _avatarPlaceholder {
    if (student.name.isNotEmpty) {
      return student.name[0].toUpperCase();
    }
    if (student.email.isNotEmpty) {
      return student.email[0].toUpperCase();
    }
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.grey[50]!],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar Section
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        progressColor,
                        progressColor.withValues(alpha: 0.7),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: progressColor.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                    child:
                        avatarUrl == null
                            ? Text(
                              _avatarPlaceholder ?? '?',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            )
                            : null,
                  ),
                ),

                // Progress indicator around avatar
              ],
            ),

            const SizedBox(width: 20),

            // Student Info Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row with name and role
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _fullName,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[900],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline,
                                  size: 14,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  student.role.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Email verification badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _emailStatusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _emailStatusColor.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              student.emailVerified
                                  ? Icons.verified_outlined
                                  : Icons.error_outline,
                              size: 12,
                              color: _emailStatusColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              student.emailVerified ? 'Verified' : 'Unverified',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: _emailStatusColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Email
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          student.email,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Course info
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 14,
                              color: Colors.grey[700],
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                course.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        if (course.description.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text(
                            course.description,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],

                        const SizedBox(height: 6),
                        Text(
                          _courseCreatedInfo,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Progress section
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Course Progress',
                  //           style: GoogleFonts.poppins(
                  //             fontSize: 13,
                  //             fontWeight: FontWeight.w600,
                  //             color: Colors.grey[700],
                  //           ),
                  //         ),
                  //         if (_progressIcon != null)
                  //           Icon(
                  //             _progressIcon,
                  //             size: 16,
                  //             color: _progressTextColor,
                  //           ),
                  //       ],
                  //     ),
                  //
                  //     const SizedBox(height: 8),
                  //
                  //     // Progress bar with percentage
                  //     Stack(
                  //       children: [
                  //         LinearProgressIndicator(
                  //           value: progress,
                  //           minHeight: 12,
                  //           borderRadius: BorderRadius.circular(6),
                  //           valueColor: AlwaysStoppedAnimation<Color>(
                  //             progressColor,
                  //           ),
                  //           backgroundColor: Colors.grey[200],
                  //         ),
                  //
                  //         // Animated percentage text
                  //         if (progress > 0)
                  //           Positioned.fill(
                  //             child: Align(
                  //               alignment: Alignment.center,
                  //               child: Text(
                  //                 '${(progress * 100).toStringAsFixed(1)}%',
                  //                 style: GoogleFonts.poppins(
                  //                   fontSize: 9,
                  //                   fontWeight: FontWeight.bold,
                  //                   color:
                  //                       progress > 0.5
                  //                           ? Colors.white
                  //                           : Colors.grey[700],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //       ],
                  //     ),
                  //
                  //     const SizedBox(height: 6),
                  //
                  //     Text(
                  //       _progressText,
                  //       style: GoogleFonts.poppins(
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w600,
                  //         color: _progressTextColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
