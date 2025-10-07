# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Customer(models.Model):
    customer_id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=255)
    phone_number = models.CharField(unique=True, max_length=15)
    email = models.CharField(unique=True, max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Customer'


class CustomerAccount(models.Model):
    username = models.CharField(primary_key=True, max_length=100)
    password = models.CharField(max_length=255)
    is_verified = models.IntegerField(blank=True, null=True)
    is_active = models.IntegerField(blank=True, null=True)
    customer = models.OneToOneField(Customer, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Customer_Account'


class Employee(models.Model):
    employee_id = models.AutoField(primary_key=True)
    full_name = models.CharField(max_length=255)
    date_of_birth = models.DateField(blank=True, null=True)
    phone_number = models.CharField(unique=True, max_length=15)
    email = models.CharField(unique=True, max_length=255)
    citizen_id = models.CharField(unique=True, max_length=20)
    gender = models.IntegerField(blank=True, null=True)
    address = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Employee'


class EmployeeAccount(models.Model):
    username = models.CharField(primary_key=True, max_length=100)
    password = models.CharField(max_length=255)
    role = models.CharField(max_length=7)
    is_active = models.IntegerField(blank=True, null=True)
    employee = models.OneToOneField(Employee, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Employee_Account'


class League(models.Model):
    league_id = models.AutoField(primary_key=True)
    sport_type = models.ForeignKey('SportType', models.DO_NOTHING)
    league_name = models.CharField(max_length=255)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'League'
        unique_together = (('league_name', 'start_date'),)


class Match(models.Model):
    match_id = models.AutoField(primary_key=True)
    match_time = models.DateTimeField()
    description = models.TextField(blank=True, null=True)
    stadium = models.ForeignKey('Stadium', models.DO_NOTHING)
    league = models.ForeignKey(League, models.DO_NOTHING)
    round = models.CharField(max_length=50, blank=True, null=True)
    team_1 = models.ForeignKey('Team', models.DO_NOTHING)
    team_2 = models.ForeignKey('Team', models.DO_NOTHING, related_name='match_team_2_set')
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Match'
        unique_together = (('match_time', 'stadium'), ('league', 'round', 'team_1', 'team_2'),)


class MatchHistory(models.Model):
    m_history_id = models.AutoField(primary_key=True)
    match = models.ForeignKey(Match, models.DO_NOTHING)
    changed_at = models.DateTimeField(blank=True, null=True)
    employee = models.ForeignKey(Employee, models.DO_NOTHING)
    change_type = models.CharField(max_length=100, blank=True, null=True)
    old_value = models.TextField(blank=True, null=True)
    new_value = models.TextField(blank=True, null=True)
    reason = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Match_History'


class OrderDetails(models.Model):
    detail_id = models.AutoField(primary_key=True)
    order = models.ForeignKey('Orders', models.DO_NOTHING)
    pricing = models.ForeignKey('SectionPrices', models.DO_NOTHING)
    qr_code = models.CharField(unique=True, max_length=255, blank=True, null=True)
    seat = models.ForeignKey('Seats', models.DO_NOTHING, blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    promo = models.ForeignKey('Promotions', models.DO_NOTHING, blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Order_Details'
        unique_together = (('order', 'seat'),)


class Orders(models.Model):
    order_id = models.AutoField(primary_key=True)
    customer = models.ForeignKey(Customer, models.DO_NOTHING)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    order_status = models.CharField(max_length=9, blank=True, null=True)
    order_method = models.CharField(max_length=7, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Orders'


class Payment(models.Model):
    payment_id = models.AutoField(primary_key=True)
    order = models.ForeignKey(Orders, models.DO_NOTHING)
    payment_method = models.CharField(max_length=50, blank=True, null=True)
    payment_status = models.CharField(max_length=7, blank=True, null=True)
    transaction_code = models.CharField(unique=True, max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Payment'


class PriceHistory(models.Model):
    p_history_id = models.AutoField(primary_key=True)
    pricing = models.ForeignKey('SectionPrices', models.DO_NOTHING)
    old_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    new_price = models.DecimalField(max_digits=10, decimal_places=2)
    effective_time = models.DateTimeField()
    changed_at = models.DateTimeField(blank=True, null=True)
    changed_by = models.ForeignKey(Employee, models.DO_NOTHING, db_column='changed_by', db_comment='employee_id')
    reason = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Price_History'


class PromotionDetails(models.Model):
    pk = models.CompositePrimaryKey('promo_id', 'match_id', 'section_id')
    promo = models.ForeignKey('Promotions', models.DO_NOTHING)
    match = models.ForeignKey(Match, models.DO_NOTHING)
    section = models.ForeignKey('Sections', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Promotion_Details'


class Promotions(models.Model):
    promo_id = models.AutoField(primary_key=True)
    promo_code = models.CharField(unique=True, max_length=50)
    discount_value = models.DecimalField(max_digits=10, decimal_places=2)
    discount_type = models.CharField(max_length=12)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    usage_limit = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    employee = models.ForeignKey(Employee, models.DO_NOTHING)
    status = models.IntegerField(blank=True, null=True, db_comment='0: active, 1: inactive')

    class Meta:
        managed = False
        db_table = 'Promotions'


class Seats(models.Model):
    seat_id = models.AutoField(primary_key=True)
    seat_code = models.CharField(unique=True, max_length=50)
    seat_number = models.CharField(max_length=20)
    section = models.ForeignKey('Sections', models.DO_NOTHING)
    status = models.IntegerField(blank=True, null=True, db_comment='0: available, 1: maintenance')

    class Meta:
        managed = False
        db_table = 'Seats'


class SectionPrices(models.Model):
    pricing_id = models.AutoField(primary_key=True)
    match = models.ForeignKey(Match, models.DO_NOTHING)
    section = models.ForeignKey('Sections', models.DO_NOTHING)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    available_seats = models.IntegerField()
    is_closed = models.IntegerField(blank=True, null=True, db_comment='false: open for sale, true: closed')
    sell_time = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Section_Prices'
        unique_together = (('match', 'section'),)


class Sections(models.Model):
    section_id = models.AutoField(primary_key=True)
    section_name = models.CharField(max_length=50)
    stadium = models.ForeignKey('Stadium', models.DO_NOTHING)
    capacity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Sections'
        unique_together = (('stadium', 'section_name'),)


class SportType(models.Model):
    sport_type_id = models.AutoField(primary_key=True)
    sport_type_name = models.CharField(unique=True, max_length=100)
    description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Sport_Type'


class Stadium(models.Model):
    stadium_id = models.AutoField(primary_key=True)
    stadium_name = models.CharField(unique=True, max_length=255)
    location = models.CharField(max_length=255, blank=True, null=True)
    capacity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Stadium'


class Team(models.Model):
    team_id = models.AutoField(primary_key=True)
    team_name = models.CharField(unique=True, max_length=255)
    logo = models.CharField(max_length=255, blank=True, null=True)
    head_coach = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Team'


class TicketReturns(models.Model):
    return_id = models.AutoField(primary_key=True)
    detail = models.OneToOneField(OrderDetails, models.DO_NOTHING)
    return_reason = models.TextField(blank=True, null=True)
    return_status = models.CharField(max_length=9, blank=True, null=True)
    refund_method = models.CharField(max_length=50, blank=True, null=True)
    return_time = models.DateTimeField(blank=True, null=True)
    processed_time = models.DateTimeField(blank=True, null=True)
    refund_amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    employee = models.ForeignKey(Employee, models.DO_NOTHING, blank=True, null=True)
    note = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Ticket_Returns'
class ChatHistory(models.Model):
    id = models.AutoField(primary_key=True)
    customer = models.ForeignKey('Customer', on_delete=models.CASCADE)  # khóa ngoại tới Customer
    user_message = models.TextField()
    bot_response = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    session_id = models.CharField(max_length=100, blank=True, null=True)  # phiên history

    class Meta:
        db_table = 'Chathistory'