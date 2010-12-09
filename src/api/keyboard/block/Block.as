package api.keyboard.block
{
	import api.events.keyboard.block.BlockEvent;

	import api.keyboard.Keyboard;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>key</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_KEY
	*/
	[Event(name="missingKey" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Prevent Flash from seeing the specified key code. If any of the optional shift states are specified, the key will only be blocked if that exact shift key pattern is matched. If any of the optional shift keys are specified, they must all be specified (or an error will be returned).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_block.html Northcode Help Documentation
	*/
	public class Block extends Keyboard
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var alt:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var ctrl:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var shift:Boolean = false;
		
		// Required
		/**
		* The virtual key code to block.
		*
		* @defaultValue <code>null</code>
		*/
		public var key:String = null;
		
		/**
		* Constructor for Keyboard.Block()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_block.html Northcode Help Documentation
		*/
		public function Block(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Prevent Flash from seeing the specified key code. If any of the optional shift states are specified, the key will only be blocked if that exact shift key pattern is matched. If any of the optional shift keys are specified, they must all be specified (or an error will be returned).
		*
		*
		* @param keyCode
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Keyboard_block.html Northcode Help Documentation
		*/
		public function block( keyCode:String = null ):void
		{
			key = compareStrings( keyCode , key );
			
			switch( key )
			{
				case null:
					missingKey();
					break;
				default:
					var __a:int = convertBooleanToBinary( alt );
					var __c:int = convertBooleanToBinary( ctrl );
					var __s:int = convertBooleanToBinary( shift );
					
					ssCore.Keyboard.block( {key:key , alt:__a , ctrl:__c , shift:__s}
										  ,{callback:actionComplete, errorSTR:"blockError", code:"25000"} ); 
			}
		}
	}
}