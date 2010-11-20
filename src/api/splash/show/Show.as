package api.splash.show
{
	import api.events.splash.show.ShowEvent;

	import api.splash.Splash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_show.html Northcode Help Documentation
	*/
	public class Show extends Splash
	{
		public var resource						:String							= null;
		
		/**
		* Constructor for Splash.Show()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_show.html Northcode Help Documentation
		*/
		public function Show(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param __resource
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_show.html Northcode Help Documentation
		*/
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