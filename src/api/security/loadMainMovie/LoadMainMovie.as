package api.security.loadMainMovie
{
	import api.events.security.loadMainMovie.LoadMainMovieEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Call this function to load the main movie from your expiry movie.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_loadMainMovie.html Northcode Help Documentation
	*/
	public class LoadMainMovie extends Security
	{		
		/**
		* Constructor for Security.LoadMainMovie()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_loadMainMovie.html Northcode Help Documentation
		*/
		public function LoadMainMovie(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Call this function to load the main movie from your expiry movie.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_loadMainMovie.html Northcode Help Documentation
		*/
		public function loadMainMovie():void
		{
			ssCore.Security.loadMainMovie( {}
										  ,{callback:actionComplete, errorSTR:"loadMainMovieError", code:"36003"} );
		}
	}
}