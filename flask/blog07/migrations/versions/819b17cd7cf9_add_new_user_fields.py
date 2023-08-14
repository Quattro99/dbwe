"""Add new user fields

Revision ID: 819b17cd7cf9
Revises: 59c266417f6d
Create Date: 2023-07-07 21:31:27.606152

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '819b17cd7cf9'
down_revision = '59c266417f6d'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.add_column(sa.Column('about_me', sa.String(length=64), nullable=True))
        batch_op.add_column(sa.Column('last_seen', sa.DateTime(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.drop_column('last_seen')
        batch_op.drop_column('about_me')

    # ### end Alembic commands ###