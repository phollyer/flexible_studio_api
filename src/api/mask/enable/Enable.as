package api.mask.enable
{
	import api.events.mask.enable.EnableEvent;

	import api.mask.Mask;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>name</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NAME
	*/
	[Event(name="missingMaskName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingName", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Enable a mask from the Masks tab or a previously loaded bitmap to create a shaped window.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_enable.html Northcode Help Documentation
	*/
	public class Enable extends Mask
	{
		// Required
		/**
		* The name of the mask or loaded bitmap mask that you want to enable.
		*
		* @defaultValue <code>null</code>
		*/
		public var name:String = null;
		
		/**
		* Constructor for Mask.Enable()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_enable.html Northcode Help Documentation
		*/
		public function Enable(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Enable a mask from the Masks tab or a previously loaded bitmap to create a shaped window.
		*
		*
		* @param maskName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mask_enable.html Northcode Help Documentation
		*/
		public function enable( maskName:String = null ):void
		{
			name = compareStrings( maskName , name );
			
			switch( name )
			{
				case null:
					missingName();
					break;
				default:
					ssCore.Mask.enable( {}
										,{callback:actionComplete, errorSTR:"enableError", code:"27001"} );
			}
		}
	}
}