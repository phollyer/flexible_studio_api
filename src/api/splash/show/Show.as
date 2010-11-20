package api.splash.show
{
	import flash.events.IEventDispatcher;
	import api.splash.Splash;

	[Bindable]
	public class Show extends Splash
	{
		public var resource						:String							= null;
		
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function show( __resource:String = null ):void
		{
			resource = compareStrings( __resource , resource );
			switch( resource )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Splash.show( {resource:resource} , {callback:actionComplete, errorSTR:"showError", code:"5003"} );
			}
		}
	}
}