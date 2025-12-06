enum UserRoles {
  student(1),
  professor(2),
  admin(3),
  superUser(4),
  unknown(5);

  final int id;
  const UserRoles(this.id);
}
