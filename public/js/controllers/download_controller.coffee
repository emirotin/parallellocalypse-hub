define [
], ->
	return ['$scope', '$sce',
		($scope, $sce) ->
			$scope.downloadUrl = '/api/download'


			$scope.$watch 'parallella', (parallella) ->
				if parallella.processorType == 'Z7010'
					parallella.coprocessorCore = '16'

				console.log(parallella.networkConfig.type)
				if parallella.networkConfig.type == 'ethernet'
					downloadUrl = 'http://parallellocalypse.s3-website-us-east-1.amazonaws.com/os/resin-parallellocalypse-0.1.0-0.0.14-'
					downloadUrl += parallella.processorType
					downloadUrl += '-' + parallella.coprocessorCore
					downloadUrl += '-hdmi' if parallella.hdmi?
					downloadUrl += '.img'

					$scope.downloadUrl = $sce.trustAsResourceUrl(downloadUrl)
				else
					$scope.downloadUrl = '/api/download'
			, true

			$scope.parallella = {
				networkConfig:
					type: 'ethernet'
				processorType: 'Z7010'
				coprocessorCore: '16'
				hdmi: null
			}
	]
