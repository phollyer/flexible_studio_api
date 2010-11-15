package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnSysColorChangeEvent;
	
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	public class OnSysColorChange extends App
	{
		/**
		 * Constructor for App.OnSysColorChange()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		public function OnSysColorChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_SYS_COLOR_CHANGE} , {callback:actionComplete, errorSTR:"onSysColorChangeError", code:"8032"} );
		}	
	}
}