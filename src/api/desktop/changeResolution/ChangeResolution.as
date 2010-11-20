package api.desktop.changeResolution
{
	import api.desktop.Desktop;

	import api.events.desktop.changeResolution.ChangeResolutionEvent;

	import api.vos.desktop.ChangeResolutionVO;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
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
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_changeResolution.html Northcode Help Documentation
		*/
		public function changeResolution():void
		{
			ssCore.Desktop.changeResolution( resolutionSettings
											,{callback:actionComplete, errorSTR:"changeResolutionError", code:"19002"} );
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Desktop_changeResolution.html Northcode Help Documentation
		*/
		public function changeResolutionComplete( r:Object , c:Object , e:Object ):void
		{
			switch( r.success )
			{
				case true:
					var event : ChangeResolutionEvent = new ChangeResolutionEvent( ChangeResolutionEvent.RESULT );
					dispatchEvent( event );
					break;
				case false:
					e.id = "19002";
					dispatchError( DesktopError.CHANGE_RESOLUTION_ERROR , e );
			}
		}
	}
}