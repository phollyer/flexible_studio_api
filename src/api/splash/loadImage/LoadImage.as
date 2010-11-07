package api.splash.loadImage
{
	import flash.events.IEventDispatcher;
	import api.splash.Splash;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class LoadImage extends Splash
	{
		public var resource:String = null;
		
		public function LoadImage(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function loadImage( pathToResource:String = null ):void
		{
			resource = compareStrings( pathToResource , resource );
			switch( resource )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Splash.loadImage( {resource:resource} , {callback:actionComplete, errorSTR:"loadImageError", code:"5001"} );
			}
		}
	}
}