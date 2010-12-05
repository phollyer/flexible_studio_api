package api.desktop.changeResolution
{
	import api.desktop.Desktop;

	import api.events.desktop.changeResolution.ChangeResolutionEvent;

	import api.vos.desktop.ChangeResolutionVO;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Change the desktop resolution to provide better rendering performance or to avoid having your application resized (and possibly stretched) to fill the users desktop.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_changeResolution.html Northcode Help Documentation
	*/
	public class ChangeResolution extends Desktop
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var resolutionSettings:ChangeResolutionVO = new ChangeResolutionVO();
		
		/**
		* Constructor for Desktop.ChangeResolution()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_changeResolution.html Northcode Help Documentation
		*/
		public function ChangeResolution(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Change the desktop resolution to provide better rendering performance or to avoid having your application resized (and possibly stretched) to fill the users desktop.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_changeResolution.html Northcode Help Documentation
		*/
		public function changeResolution():void
		{
			ssCore.Desktop.changeResolution( resolutionSettings
											,{callback:actionComplete, errorSTR:"changeResolutionError", code:"19002"} );
		}
	}
}