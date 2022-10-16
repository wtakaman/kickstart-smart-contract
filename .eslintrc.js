const config = {
	extends: ['eslint-config-airbnb'],
	rules: {
		'valid-jsdoc': 'off',
		'max-len': 'off',
		'space-before-function-paren': [
			'error',
			{
				anonymous: 'never',
				named: 'never',
				asyncArrow: 'always',
			},
		],
	},
};

module.exports = config;
