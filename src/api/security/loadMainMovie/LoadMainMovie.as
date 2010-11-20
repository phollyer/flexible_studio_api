package api.security.loadMainMovie
{
	import flash.events.IEventDispatcher;
	
	import api.errors.Security_Error;
	import api.security.Security;

	[Bindable]
	public class LoadMainMovie extends Security
	{		
		public function LoadMainMovie(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function loadMainMovie():void
		{
			ssCore.Security.loadMainMovie( {}
										  ,{callback:actionComplete, errorSTR:"loadMainMovieError", code:"36003"} );
		}
	}
}