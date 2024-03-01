'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
    await queryInterface.addColumn('master_firms', 'ProductProduced', {
      type: Sequelize.STRING, // Modify the data type as needed
      allowNull: true, // Modify the constraints as needed
    });

    await queryInterface.addColumn('master_firms', 'Quantity', {
      type: Sequelize.INTEGER,
      allowNull: true,
      defaultValue: 0, // You can set a default value if needed
    });
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
  }
};
