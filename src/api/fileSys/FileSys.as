package api.fileSys
{
	import flash.events.IEventDispatcher;
	
	import api.Kernel;
	

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys.html Northcode Help Documentation
	*/
	public class FileSys extends Kernel
	{
		/**
		* Constructor for FileSys()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys.html Northcode Help Documentation
		*/
		public function FileSys(target:IEventDispatcher=null)
		{
			super(target);
		}		
		
		/**
		 * An Error has occured so package Error
		 * Data and send out the data
		 */
		override public function dispatchError( errorSTR:String , e:Object ):void
		{
			super.dispatchError( errorSTR , e );
			var error:FileSysError = new FileSysError( errorSTR );
			errors.code = e.id + "-" + e.code;
			errors.summary = e.description;
			errors.command = e.command;
			errors.description = null;
			dispatchEvent( error );
		}
		/**
		* This method should be called when a SWF Studio action
		* has completed successfully.
		*
		* <p>This method should be overridden by sub classes in
		* order to dispatch Class specific data</p>
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult(r:Object):void
		{
		}
	}
}